ENV["RAILS_ENV"] ||= "test"

require File.expand_path(File.dirname(__FILE__) + '/../../spec/fixtures/app/config/environment')  
require 'cucumber/rails/world'
require 'cucumber/rails/rspec'
require 'cucumber/formatter/unicode'

require 'webrat'
require 'webrat/core/matchers'

Webrat.configure do |config|
  config.mode = :rails
end
