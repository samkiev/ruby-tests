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


  end

#Logout_method
  def logged_out(browser)
    browser.find_element(class: "logout").click
    sleep 2

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

  end
end

