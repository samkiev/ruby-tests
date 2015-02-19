require_relative 'Verification'
module Logout


  #Logout_method
  def logged_out
    $browser.find_element(class: "logout").click
    sleep 2
    #Check logout
    include Verification
    fail 'Did not meet expected Title Text' unless message_for_title('Redmine demo')
    puts "Log out = OK"
  end
end