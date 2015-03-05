Then(/^I logged out$/) do
  logged_out(@browser)
end

Given(/^Login with "([^"]*)" and "([^"]*)"$/) do |login, password|
  login = @login
  password = @password
  logged_in(login, password, @browser)
end

When(/^I should be login$/) do
  #Check login
  message_is_login(@login, @browser)
end

Then(/^I Change "([^"]*)"$/) do |new_password|
  change_password(@password, @new_password, @browser)
end

And(/^I should see message when my "([^"]*)" changed$/) do |new_password|
  message_is('Password was successfully updated.', @browser)
end