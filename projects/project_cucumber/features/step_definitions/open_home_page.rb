



Given(/^Web application is started on$/) do
   @browser.get 'http://demo.redmine.org'
end


When(/^I visit the home page$/) do
  @is_message = @browser.title
  expect(@is_message).to eql 'Redmine demo'
end

Then(/^I should see the home page$/) do
  expect(@is_message).to eql 'Redmine demo'
end