
Given(/^I Create new Project with "([^"]*)"$/) do |project_name|
  create_new_project(@project_name, @browser)
end

When(/^I should see message "([^"]*)" Created$/) do |id_project_user|

  message_is('Successful creation.', @browser)
end

And(/^Add "([^"]*)" into project$/) do |new_user_id|
  add_new_user_to_project(@name_new_user, @id["id_second_user"], @browser)

end

When(/^I should see "([^"]*)" added into project$/) do |project_user_id|
#Check od add user to the project
  @id["project_user_id"] = get_project_user_id(@browser)
  check_add_user(@name_new_user, @browser)
end

Then(/^I should be changed "([^"]*)" Roles$/) do |project_user_id|
  edit_user_roles(@id["project_user_id"], @browser)
end


And(/^Verify what roles is change$/) do
 check_role_user_message('Reporter', @id["project_user_id"], @browser)
end

Given(/^I Create new project version$/) do
  create_new_project_version(@version_name, @browser)
end

And(/^I should see new project Version$/) do
  #Check Creation project version
  check_add_user(@version_name, @browser)


end
