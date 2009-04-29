
module Doorman
  class InvalidRule < StandardError
    def initialize(*args)
      super "rails_doorman: invalid rule #{args.inspect}"
    end
  end
      
  class Rule
    def self.from_hash(type, opts)
      rule = new(type)
      h = opts.except(:only, :exclude)
      if h.size > 1
        raise InvalidRule.new(type, opts)
      end
      rule.method = h.keys.first.to_sym
      unless Doorman.supported_method?(rule.method)
        raise InvalidRule.new(type, opts)
      end
      rule.value = h.values.first
      rule.limits = extract_limits(opts)
      rule
    end
    
    def self.from_block(type, opts = nil, &block)
      unless block.arity == 1
        raise InvalidRule.new(type, opts, block)
      end
      opts ||= {}
      rule = new(type)
      rule.method = :block
      rule.value = block
      rule.limits = extract_limits(opts)
      rule
    end
    
    def self.extract_limits(h)
      h.slice(:only, :exclude).inject({}) do |limits, kv| 
        limits.merge!(kv.first => Array(kv.last).map {|limit| limit.to_sym })
      end
    end
    
    attr_accessor :type, :method, :value, :limits
    
    def initialize(type)
      @type, @limits = type, {}
    end
    
    def deny?
      type == :deny
    end
    
    def evaluate?(action_name)
      (!limits.key?(:only) || limits[:only].include?(action_name.to_sym)) &&
        (!limits.key?(:exclude) || !limits[:exclude].include?(action_name.to_sym))
    end
  end
  
end
