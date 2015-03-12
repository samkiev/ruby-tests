

Given(/^Web application is started on$/) do
  visit_page(HomePage)
end


When(/^I visit the home page$/) do
  on(HomePage).title.should == 'Redmine demo'
end

Then(/^I go to registration page$/) do
  on(HomePage).register
end