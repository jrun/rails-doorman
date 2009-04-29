$:.unshift(File.dirname(__FILE__) + '/../lib')

ENV["RAILS_ENV"] ||= 'test'

unless defined?(RAILS_ROOT)
  require File.dirname(__FILE__) + "/fixtures/app/config/environment"
end

require 'spec'
require 'spec/rails'

require 'rails_doorman'

Spec::Runner.configure do |config|
end

# # deny :user => "bill"       # calls current_user.login, but this is configurable
# # deny {|c| c.params["arbitrary"] == "expressions"}
# #
# #
# # # mostly closed:
# # deny :all                           # removes implicit final allow :all
# # allow :host => "*.example.com"
# # allow :time => "8am-5pm"
# #
# # # store a block for repeated usage
# # Merb::Access.add_block :admin, {|c| c.current_user.admin?}
# #
# # allow :admin
