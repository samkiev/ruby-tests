require 'selenium-webdriver'
require_relative 'Verification'

module Register

include Verification

#Open Home Page
        def open_home_page(browser)
          browser.get 'http://demo.redmine.org'
        end

#Register_method
    def create_account(login, password, name, browser)


    #fill fields
      browser.find_element(class: "register").click
      browser.find_element(id: "user_login").send_key login
      browser.find_element(id: "user_password").send_key password
      browser.find_element(id: "user_password_confirmation").send_key password
      browser.find_element(id: "user_firstname").send_key name
      browser.find_element(id: "user_lastname").send_key "last_name_"+login
      browser.find_element(id: "user_mail").send_key login + "@usermail.com"
      Selenium::WebDriver::Support::Select.new(browser.find_element(:id, "user_language")).
          select_by(:value, "en")
      browser.find_element(name: "commit").click
    sleep 2
    #Check Registration
        fail 'Did not meet expected text' unless message_is(('Ваша учётная запись активирована. Вы можете войти.')||('Your account has been activated. You can now log in.'), browser)
          puts "Create new user = OK"
    end

end
