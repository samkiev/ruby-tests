require_relative 'Verification'

module Change_password

  #Change password
  def change_password(password, new_password)
    include Verification
    $browser.find_element(class: "my-account").click
    $browser.find_element(class: "icon-passwd").click
    $browser.find_element(id: "password").send_key(password)
    $browser.find_element(id: "new_password").send_key(new_password)
    $browser.find_element(id: "new_password_confirmation").send_key(new_password)
    $browser.find_element(name: "commit").click
    sleep 2
    #Check Change password
    fail 'Did not meet expected text' unless message_is'Password was successfully updated.'
    puts "Change password = OK"

  end

end