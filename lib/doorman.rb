require 'doorman/rule'
require 'doorman/helpers'

module Doorman
  class Unauthorized < StandardError; end
  
  class << self
    def options
      @options ||= {
        :user_identifier_method => :login,
        :has_role_method => :has_role?
      }
    end
    
    SUPPORTED_METHODS = [:block, :host, :role, :user, :user_agent].freeze
    
    def supported_method?(method)
      SUPPORTED_METHODS.include?(method)
    end
              
    def included(base)
      base.extend(ClassMethods)
      base.class_eval do
        include InstanceMethods
        include SharedMethods
        helper Doorman::SharedMethods, Doorman::Helpers
        before_filter :_doorman_check_acl
      end
    end
  end
      
  module ClassMethods
    def _doorman_list
      @_doorman_list ||= []
    end
    
    def _doorman_default
      @_doorman_default ||= :allow
    end
    
    def  deny(*args, &block)
      _add_acl(:deny, args, block)
    end
    
    def allow(*args, &block)
      _add_acl(:allow, args, block)
    end
    
    def _clear_acl_list
      @_doorman_list = nil
    end
    
    def _add_acl(type, args, block)
      opts = args.is_a?(Array) ? args.first : args
      if opts == :all
        @_doorman_default = type
        return true
      end
      if block
        _doorman_list << Rule.from_block(type, opts, &block)
      else
        _doorman_list << Rule.from_hash(type, opts)
      end
    end
  end
  
  module InstanceMethods
    private
    def _doorman_check_acl
      allowed = false
      self.class._doorman_list.each do |rule|
        next unless rule.evaluate?(self.action_name)
        if _check_rule(rule)
          allowed = true
        else
          raise Unauthorized
        end
      end
      if self.class._doorman_default == :deny && !allowed
        raise Unauthorized
      end
    end
  end

  module SharedMethods
    # self can either be in a controller or view context. 
    private
    def _check_rule(rule)
      match = case rule.method
        when :block
          rule.value.call(self)            
        when :host
          request.host =~ Regexp.new(rule.value)
        when :role
          current_user && current_user.send(Doorman.options[:has_role_method], rule.value)
        when :user
          current_user && current_user.send(Doorman.options[:user_identifier_method]).to_sym  == rule.value.to_sym
        when :user_agent 
          request.user_agent =~ Regexp.new(rule.value)
        else
          false
        end
      rule.deny? ? !match : match
    end
  end
  
end

ActionController::Base.class_eval do
  include Doorman
end
