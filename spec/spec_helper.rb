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
