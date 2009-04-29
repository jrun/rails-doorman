Given /^I am (.*)$/ do |name|
  ApplicationController.current_user.reset
  ApplicationController.current_user.login = name.downcase
end

Given /^I have no roles$/ do
  ApplicationController.current_user.reset
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
