require_relative 'Verification'

module Login

  #Login_method
  def logged_in(login, password)
    $browser.find_element(class: "login").click
    $browser.find_element(id: "username").send_key(login)
    $browser.find_element(id: "password").send_key(password)
    $browser.find_element(name: "login").click
    sleep 2
    #Check login
    fail 'Did not meet expected Title Text' unless message_is_login(login)
    puts "Login  1-st user = OK"

  end

end