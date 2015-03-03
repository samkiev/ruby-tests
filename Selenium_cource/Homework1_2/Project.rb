require_relative 'Verification'

module Project
include(Verification)

  def create_new_project(project_name, browser)

    browser.find_element(class: "projects").click
    browser.find_element(class: "icon-add").click
    browser.find_element(id: "project_name").send_key(project_name)
    browser.find_element(id: "project_description").send_key("projectname")
    browser.find_element(id: "project_identifier").clear

    browser.find_element(id: "project_identifier").send_keys(project_name+'id')
  sleep 2
    browser.find_element(id: "project_inherit_members").click
    browser.find_element(name: "commit").click
  sleep 2

  # Check Creation
    fail 'Did not meet expected text' unless message_is('Successful creation.', browser)
      puts "Create new project = OK"

  end

# Add another(new) user to the project
  def add_new_user_to_project(name_new_user, user_id, browser)

    browser.find_element(id: "tab-members").click
    browser.find_element(id: "principal_search").send_key(name_new_user)
  sleep 2
    browser.find_element(css: "#principals>label>input[value='#{user_id}']").click
    browser.find_element(css: "#new_membership>fieldset>p>label>input[value='5']").click
    browser.find_element(css: "#new_membership>fieldset>p>label>input[value='4']").click
    browser.find_element(id: "member-add-submit").click
  sleep 2
  #Check od add user to the project
    fail 'Did not meet expected result' unless check_add_user(name_new_user, browser)
      puts "ADd new User = OK"

  end

#Edit Users Roles
  def edit_user_roles(project_user_id, browser)
    browser.find_element(css: "#member-#{project_user_id} a.icon.icon-edit").click
    browser.find_element(css: "#member-#{project_user_id}-roles-form input[value='4']").click
    browser.find_element(css: "#member-#{project_user_id}-roles-form input[value='Save']").click
  #Check Changes of role
  sleep 2
    fail 'Did not meet expected text' unless check_role_user_message('Reporter', project_user_id, browser)
      puts "Edit Roles new user = OK"

  end

  # Create Project Version
  def create_new_project_version(version_name, browser)
    browser.find_element(id: "tab-versions").click
    browser.find_element(class: "icon-add").click
    browser.find_element(id: "version_name").send_keys version_name
    browser.find_element(name: "commit").click
  sleep 2
  #Check Creation project version
     fail 'Did not meet expected result' unless check_add_user(version_name, browser)
       puts "Create Project version = OK"

  end

end