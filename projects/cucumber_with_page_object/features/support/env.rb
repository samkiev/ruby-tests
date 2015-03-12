require_relative '../../features/modules/Verification'
require_relative '../../features/modules/Get_value'
require_relative '../../features/classes/Home_page'

World(PageObject::PageFactory)
require 'page-object'
require 'rspec'
require 'selenium-webdriver'

include Verification
include Get_value

rnd = rand(1000)
add_to_login = rnd.to_s
DEFAULT_DATA = {

    'login' => "testuseron" + add_to_login.to_s,
    'password' => 'password',
    'password_confirm' => 'password',
    'user_firstname' => 'firstname'+add_to_login,
    'user_lastname' => 'lastname'+add_to_login,
    'email' => 'name'+add_to_login +'@usermaill.com',
    'new_login' => 'newtestuseron'+ add_to_login,
    'new_password' => 'password' + add_to_login,
    'new_password_confirm' => 'password' + add_to_login,
    'newuser_name' => 'newname'+add_to_login,
    'newuser_lastname' => 'newlastname'+add_to_login,
    'new_user_email' => 'newname'+add_to_login +'@usermaill.com',
    'language' => 'English',
    'project_name' => "project" + add_to_login.to_s,
    'project_version_name' => "version" + add_to_login.to_s,
    'issue_bug' => 'Bug',
    'isuue_feature' => 'Feature',
    'issue_support' => 'Support',
}

Before do
  @browser = Selenium::WebDriver.for :firefox
  PageObject.default_page_wait = 10
  PageObject.default_element_wait = 10

#Input Values
  @home_page_name = 'http://demo.redmine.org'
  rnd = rand(1000)
  add_to_login = rnd.to_s
  @login = "testuseron" + add_to_login.to_s
  @password = @login
  @name = "name" + @login
  @new_password = @password + add_to_login
  @new_user_login = "newtestuser" + add_to_login
  @name_new_user = "itlabs"+ add_to_login
  @project_name = @name_new_user + "project" + add_to_login
  @version_name = "new_version"+add_to_login
#Use Hash Array
  @id = Hash.new
  @issue_value = Hash["bug" => '1', "feature" => '2', "support" => '3']
  @subject_issue = Hash['bug' => 'bug_issue', "feature" => 'feature_issue', "support" => 'support_issue']
end

After do
puts @id
  @browser.close
end

