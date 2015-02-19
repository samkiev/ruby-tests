require 'selenium-webdriver'

@browser = Selenium::WebDriver.for :firefox

#Main Values
add_to_login = "859"
login = "testuser" + add_to_login
password = login
name = "name" + login
new_password = password + add_to_login
new_user_login = "newtestuser" + add_to_login
name_new_user = "itlabs"+ add_to_login
project_name = name_new_user + "project" + add_to_login
version_name = "new_version"+add_to_login
subject_bug = "bug_issue"
subject_feature = "feature_issue"
subject_support = "support_issue"

#Open Home Page
        def open_home_page
          @browser.get 'http://demo.redmine.org'
        end

#Register_method
    def create_account(login, password, name)


      #fill fields
            @browser.find_element(class: "register").click
            @browser.find_element(id: "user_login").send_key login
            @browser.find_element(id: "user_password").send_key password
            @browser.find_element(id: "user_password_confirmation").send_key password
            @browser.find_element(id: "user_firstname").send_key name
            @browser.find_element(id: "user_lastname").send_key "last_name_"+login
            @browser.find_element(id: "user_mail").send_key login + "@usermail.com"
            Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "user_language")).
                select_by(:value, "en")
            @browser.find_element(name: "commit").click
            sleep 2
      fail 'Did not meet expected text' unless message_is(('Ваша учётная запись активирована. Вы можете войти.')||('Your account has been activated. You can now log in.'))
            puts "Create new user = OK"
    end
#Get text for Verification for "flash_notice"

                def message_is(message)
                  @browser.find_element(id: 'flash_notice').text.include? message
                end


#Get ID User Method
        def get_user_id
           @browser.find_element(class: "active").attribute("href")[-5, 5]

        end

#Logout_method
        def logged_out
            @browser.find_element(class: "logout").click
                  sleep 2
        #Check logout
            fail 'Did not meet expected Title Text' unless message_for_title('Redmine demo')
                     puts "Log out = OK"
        end
#Get text for Verificatio for "Title"

                def message_for_title(message)
                  @browser.title.include? message
                end


#Login_method
    def logged_in(login, password)
      @browser.find_element(class: "login").click
      @browser.find_element(id: "username").send_key(login)
      @browser.find_element(id: "password").send_key(password)
      @browser.find_element(name: "login").click
      sleep 2
    #Check login
      fail 'Did not meet expected Title Text' unless message_is_login(login)
        puts "Login  1-st user = OK"

    end

#Get text for Verification of login

def message_is_login(message)
  @browser.find_element(class: "active").text.include? message
end

#Change password
    def change_password(password, new_password)
      @browser.find_element(class: "my-account").click
      @browser.find_element(class: "icon-passwd").click
      @browser.find_element(id: "password").send_key(password)
      @browser.find_element(id: "new_password").send_key(new_password)
      @browser.find_element(id: "new_password_confirmation").send_key(new_password)
      @browser.find_element(name: "commit").click
      sleep 2
      #Check Change password
      fail 'Did not meet expected text' unless message_is'Password was successfully updated.'
            puts "Change password = OK"

    end


#Create new  project
    def create_new_project(project_name)

      @browser.find_element(class: "projects").click
      @browser.find_element(class: "icon-add").click
      @browser.find_element(id: "project_name").send_key(project_name)
      @browser.find_element(id: "project_description").send_key("projectname")
      @browser.find_element(id: "project_identifier").clear

      @browser.find_element(id: "project_identifier").send_keys(project_name+'id')
      sleep 2
      @browser.find_element(id: "project_inherit_members").click
      @browser.find_element(name: "commit").click
      sleep 2
      # Check Creation
      fail 'Did not meet expected text' unless message_is'Successful creation.'
          puts "Create new project = OK"

    end
# Add another(new) user to the project

    def add_new_user_to_project(name_new_user, user_id)

        @browser.find_element(id: "tab-members").click
        @browser.find_element(id: "principal_search").send_key(name_new_user)
    sleep 2
        @browser.find_element(css: "#principals>label>input[value='#{user_id}']").click
        @browser.find_element(css: "#new_membership>fieldset>p>label>input[value='5']").click
        @browser.find_element(css: "#new_membership>fieldset>p>label>input[value='4']").click
        @browser.find_element(id: "member-add-submit").click
    sleep 2
        fail 'Did not meet expected result' unless check_add_user(name_new_user)
        puts "Create new project = OK"

    end

#Get result of add mew user"

            def check_add_user(name_new_user)
              @browser.find_element(partial_link_text: name_new_user).displayed?
            end


#Get Project New User ID method
        def get_project_user_id
           @browser.find_element(class: "even").attribute("id")[-5, 5]

        end
# Edit Users Roles
    def edit_user_roles(project_user_id)
          @browser.find_element(css: "#member-#{project_user_id} a.icon.icon-edit").click
          @browser.find_element(css: "#member-#{project_user_id}-roles-form input[value='4']").click
          @browser.find_element(css: "#member-#{project_user_id}-roles-form input[value='Save']").click
    #Check Changes of role
      sleep 2
          fail 'Did not meet expected text' unless check_role_user_message('Reporter',project_user_id)
        puts "Edit Roles new user = OK"

    end

#Get text for Verification of change roles

              def check_role_user_message(message, project_user_id)
                @browser.find_element(id: "member-#{project_user_id}-roles").text.include? message
              end

# Create Project Version
    def create_new_project_version(version_name)
      @browser.find_element(id: "tab-versions").click
      @browser.find_element(class: "icon-add").click
      @browser.find_element(id: "version_name").send_keys version_name
      @browser.find_element(name: "commit").click
      sleep 2
      fail 'Did not meet expected result' unless check_add_user(version_name)
        puts "Create Project version = OK"

    end

#Get result of Version name"

                  def check_create_version(version_name)
                    @browser.find_element(partial_link_text: version_name).displayed?
                  end


#Create Bug insue
    def create_bug_insue(subject_bug, version_name)
      @browser.find_element(class: "new-issue").click

      Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "issue_tracker_id")).
          select_by(:value, "1")
      @browser.find_element(id: "issue_subject").send_keys subject_bug
      #@browser.find_element(id: "issue_description").send_keys "Steps to reprosuce"
      #Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "issue_status_id")).
      #    select_by(:value, "2")
      #Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "issue_priority_id")).
       #   select_by(:value, "5")
      #Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "issue_fixed_version_id")).
       #   select_by(:text, version_name)
      @browser.find_element(name: "commit").click
            sleep 2
      issue_id_bug = @browser.find_element(css: "#flash_notice > a").attribute("href")[-5, 5]
            fail 'Did not meet expected text' unless message_is("Issue ##{issue_id_bug} created.")
                  puts "Create Bug issue = OK"
    end



#Create Feature Issue
    def create_feature_issue(subject_feature)
      @browser.find_element(class: "new-issue").click

      Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "issue_tracker_id")).
          select_by(:value, "2")
      @browser.find_element(id: "issue_subject").send_keys subject_feature
#      @browser.find_element(id: "issue_description").send_keys "Steps to reprosuce"
      #Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "issue_status_id")).
        #  select_by(:value, "2")
      #Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "issue_priority_id")).
         # select_by(:value, "4")
    #Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "issue_fixed_version_id")).
    #   select_by(:text, version_name)
      @browser.find_element(name: "commit").click
      sleep 2

      issue_id_feature = @browser.find_element(css: "#flash_notice > a").attribute("href")[-5, 5]
      fail 'Did not meet expected text' unless message_is("Issue ##{issue_id_feature} created.")
            puts "Create Feature issue = OK"
    end

#Create Support Issue
    def create_support_issue(subject_support)
      @browser.find_element(class: "new-issue").click

      Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "issue_tracker_id")).
          select_by(:value, "3")
      @browser.find_element(id: "issue_subject").send_keys subject_support
      #@browser.find_element(id: "issue_description").send_keys "Steps to reprosuce"
      #Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "issue_status_id")).
      #    select_by(:value, "2")
      #Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "issue_priority_id")).
       #   select_by(:value, "4")
    #Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "issue_fixed_version_id")).
    #   select_by(:text, version_name)

      @browser.find_element(name: "commit").click
      sleep 2
          issue_id_support = @browser.find_element(css: "#flash_notice > a").attribute("href")[-5, 5]
      fail 'Did not meet expected text' unless message_is("Issue ##{issue_id_support} created.")
      puts "Create Support issue = OK"
    end

#Check method of all issue visible
        def check_displayed_issue(issue_id_bug)
            @browser.find_element(class: "selected").click
            fail 'Did not meet expected result' unless @browser.find_element(link_text: issue_id_bug).displayed?
            puts "All issue is visible on ‘Issues’ tab = OK"
        end
#Extract issue ID
        def get_issue_id
          issue_id_bug = @browser.find_element(css: "#flash_notice > a").attribute("href")[-5, 5]
        end

#Main

  open_home_page

    create_account(login, password, name)#1-st User
#Extract User ID

      user_id = get_user_id
      logged_out

    create_account(new_user_login, password, name_new_user) #second user
#Extract New User ID
      
      user_id_new_user = get_user_id
      logged_out

    logged_in(login, password)

    change_password(password, new_password)

    create_new_project(project_name)

    add_new_user_to_project(name_new_user, user_id_new_user)
#Extract Project ID
    project_user_id =  get_project_user_id

    edit_user_roles(project_user_id)

    create_new_project_version(version_name)

    create_bug_insue(subject_bug, version_name)
#Extract bug Value
    issue_id_bug = get_issue_id

    create_feature_issue(subject_feature)
#Extract Feature Value
      issue_id_feature = get_issue_id

    create_support_issue(subject_support)
#Extract Support_inssue Value
      issue_id_support = get_issue_id
    check_displayed_issue(issue_id_bug)
    check_displayed_issue(issue_id_feature)
    check_displayed_issue(issue_id_support)