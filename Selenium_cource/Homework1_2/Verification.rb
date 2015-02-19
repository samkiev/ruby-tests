require 'selenium-webdriver'

module Verification

  def message_is(message)
    $browser.find_element(id: 'flash_notice').text.include? message
  end

  #Get text for Verificatio for "Title"

  def message_for_title(message)
    $browser.title.include? message
  end

  #Get text for Verification of login

  def message_is_login(message)
    $browser.find_element(class: "active").text.include? message
  end

  #Get result of add mew user"

  def check_add_user(name_new_user)
    $browser.find_element(partial_link_text: name_new_user).displayed?
  end

  #Get result of Version name"

  def check_create_version(version_name)
    $browser.find_element(partial_link_text: version_name).displayed?
  end

  #Check method of all issue visible
  def check_displayed_issue(issue_id_bug, issue_id_feature, issue_id_support)
    $browser.find_element(class: "selected").click
    fail 'Did not meet expected result' unless($browser.find_element(link_text: issue_id_bug))&&($browser.find_element(link_text: issue_id_feature))&&($browser.find_element(link_text: issue_id_support)).displayed?
    puts "All issues are visible on ‘Issues’ tab = OK"
  end
end