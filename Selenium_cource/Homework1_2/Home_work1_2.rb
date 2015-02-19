require 'selenium-webdriver'
require_relative 'Verification'
require_relative 'Register'
require_relative 'Get_value'
require_relative 'Logout'
require_relative 'Login'
require_relative 'Change_password'
require_relative 'Project'
require_relative 'Issue'

$browser = Selenium::WebDriver.for :chrome



add_to_login = "765"
login = "testuser" + add_to_login
password = login
name = "name" + login
new_password = password + add_to_login
new_user_login = "newtestuser" + add_to_login
name_new_user = "itlabs"+ add_to_login
project_name = name_new_user + "project" + add_to_login
version_name = "new_version"+add_to_login
subject_bug = "bug_issue"
bug = '1'
feature = '2'
support = '3'
subject_feature = "feature_issue"
subject_support = "support_issue"

    include Register
    include Verification
    include Get_value
    include Logout
    include Login
    include Change_password
    include Project
    include Issue

      open_home_page
        create_account(login, password, name)
                                                                          id_first_user = get_user_id
            logged_out
              create_account(new_user_login, new_password, name_new_user)
                                                                          id_second_user = get_user_id
                  logged_out
                    logged_in(login, password)
                      change_password(password, new_password)
                        create_new_project(project_name)
                          add_new_user_to_project(name_new_user, id_second_user)
                                                                          project_user_id = get_project_user_id
                            edit_user_roles(project_user_id)
                              create_new_project_version(version_name)
                                create_bug_insue(subject_bug, version_name, bug)
                                                                        issue_id_bug = get_issue_id
                                  create_bug_insue(subject_feature, version_name, feature)
                                                                        issue_id_feature = get_issue_id
                                    create_bug_insue(subject_support, version_name, support)
                                                                        issue_id_support = get_issue_id
                                    check_displayed_issue(issue_id_bug, issue_id_feature, issue_id_support)