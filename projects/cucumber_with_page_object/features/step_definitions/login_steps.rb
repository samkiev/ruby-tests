Then(/^I logged out$/) do
  on(RegisterPage).logout
end

Given(/^Login with "([^"]*)" and "([^"]*)"$/) do |login, password|
  on(LoginPage).goto_login_page
  on(LoginPage).fields
end

When(/^I should be login$/) do
  #Check login
  message_is_login(DEFAULT_DATA["login"], @browser)
end

Then(/^I Change "([^"]*)"$/) do |new_password|
  on(ChangePass).fields
end

And(/^I should see message when my "([^"]*)" changed$/) do |new_password|
  message_is('Password was successfully updated.', @browser)
end