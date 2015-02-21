require_relative 'Verification'

module Login
  include(Verification)

#Login_method
  def logged_in(login, password, browser)
    browser.find_element(class: "login").click
    browser.find_element(id: "username").send_key(login)
    browser.find_element(id: "password").send_key(password)
    browser.find_element(name: "login").click
    sleep 2

  #Check login
    fail 'Did not meet expected Title Text' unless message_is_login(login, browser)
    puts "Login  1-st user = OK"

  end

#Logout_method
  def logged_out(browser)
    browser.find_element(class: "logout").click
    sleep 2

  #Check logout
    fail 'Did not meet expected Title Text' unless message_for_title('Redmine demo', browser)
    puts "Log out = OK"
  end
#Change Password Method
  def change_password(password, new_password, browser)

    browser.find_element(class: "my-account").click
    browser.find_element(class: "icon-passwd").click
    browser.find_element(id: "password").send_key(password)
    browser.find_element(id: "new_password").send_key(new_password)
    browser.find_element(id: "new_password_confirmation").send_key(new_password)
    browser.find_element(name: "commit").click
    sleep 2
    #Check Change password
    fail 'Did not meet expected text' unless message_is('Password was successfully updated.', browser)
    puts "Change password = OK"

  end
end

