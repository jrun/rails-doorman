Given /^I am (.*)$/ do |name|
  ApplicationController.reset_current_user
  ApplicationController.current_user.login = name.downcase
end

Given /^I have no roles$/ do
  ApplicationController.reset_current_user
end

Given /^I have the role (.*)$/ do |role|
  Given "I have no roles"
  ApplicationController.current_user.roles << role.to_sym
end

Then /^I should be authorized$/ do
  response.should be_authorized
end

Then /^I should not be authorized$/ do
  response.should be_unauthorized
end

When /^There is no current user$/ do
  ApplicationController.nil_current_user
end
