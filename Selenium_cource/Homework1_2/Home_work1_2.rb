require 'selenium-webdriver'
require_relative 'Verification'
require_relative 'Register'
require_relative 'Get_value'
require_relative 'Login'
require_relative 'Project'
require_relative 'Issue'

include Register
include Verification
include Get_value
include Login
include Project
include Issue

@browser = Selenium::WebDriver.for :firefox
#Input Values
#Use String
rnd = rand(1000)
add_to_login = rnd.to_s
login = "testuserok" + add_to_login.to_s
password = login
name = "name" + login
new_password = password + add_to_login
new_user_login = "newtestuser" + add_to_login
name_new_user = "itlabs"+ add_to_login
project_name = name_new_user + "project" + add_to_login
version_name = "new_version"+add_to_login
#Use Hash Array
id = Hash.new
issue_value = Hash["bug" => '1', "feature" => '2', "support" => '3']
subject_issue = Hash['bug' => 'bug_issue', "feature" => 'feature_issue', "support" => 'support_issue']


open_home_page(@browser)
create_account(login, password, name, @browser)
id["id_first_user"] = get_user_id(@browser)

logged_out(@browser)
create_account(new_user_login, new_password, name_new_user, @browser)
id["id_second_user"] = get_user_id(@browser)
logged_out(@browser)
logged_in(login, password, @browser)
change_password(password, new_password, @browser)
create_new_project(project_name, @browser)
add_new_user_to_project(name_new_user, id["id_second_user"], @browser)
id["project_user_id"] = get_project_user_id(@browser)
edit_user_roles(id["project_user_id"], @browser)
create_new_project_version(version_name, @browser)
create_bug_insue(subject_issue["bug"], version_name, issue_value["bug"], @browser)
id["issue_id_bug"] = get_issue_id(@browser)
create_bug_insue(subject_issue["feature"], version_name, issue_value["feature"], @browser)
id["issue_id_feature"] = get_issue_id(@browser)
create_bug_insue(subject_issue["support"], version_name, issue_value["support"], @browser)
id["issue_id_support"] = get_issue_id(@browser)
check_displayed_issue(id["issue_id_bug"], @browser)
check_displayed_issue(id["issue_id_feature"], @browser)
check_displayed_issue(id["issue_id_support"], @browser)

puts id