# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  filter_parameter_logging :password

  helper_method :current_user
  
  def self.nil_current_user
    self.current_user = nil
  end

  def self.reset_current_user
    self.current_user ||= User.new
    self.current_user.reset
  end
  
  protected
  cattr_accessor :current_user
  self.current_user ||= User.new
  
  
  def rescue_action_in_public(exception)
    case exception
    when Doorman::InvalidRule
      render :text => 'Invalid Rule', :status => '500 Internal Server Error'
    when Doorman::Unauthorized
      render :text => 'Unauthorized', :status => '401 Unauthorized'
    else
      super(exception)
    end
  end
  
  alias :rescue_action_locally :rescue_action_in_public
end
