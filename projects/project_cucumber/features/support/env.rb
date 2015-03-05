require_relative '../../features/modules/Verification'
require_relative '../modules/Register'
require_relative '../../features/modules/Login'
require_relative '../../features/modules/Get_value'
require_relative '../../features/modules/Project'
require_relative '../../features/modules/Issue'

require 'rspec'
require 'selenium-webdriver'

include Register
include Verification
include Login
include Get_value
include Project
include Issue

Before do
  @browser = Selenium::WebDriver.for :firefox
#Input Values
#Use String
  rnd = rand(1000)
  add_to_login = rnd.to_s
  @login = "testuserok" + add_to_login.to_s
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

