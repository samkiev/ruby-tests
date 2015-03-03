require 'selenium-webdriver'

module Verification

#Check message
  def message_is(message, browser)
    browser.find_element(id: 'flash_notice').text.include? message
  end

#Check text for Verificatio for "Title"

  def message_for_title(message, browser)
    browser.title.include? message
  end

#check text for Verification of login

  def message_is_login(message, browser)
    browser.find_element(class: "active").text.include? message
  end

#Check result of add mew user"

  def check_add_user(name_new_user, browser)
    browser.find_element(partial_link_text: name_new_user).displayed?
  end

#Check text for Verification of change roles

  def check_role_user_message(message, project_user_id, browser)
    browser.find_element(id: "member-#{project_user_id}-roles").text.include? message
  end

#Check result of creation Version name"

  def check_create_version(version_name, browser)
    browser.find_element(partial_link_text: version_name).displayed?
  end

#Check of issue visible
  def check_displayed_issue(issue_id_bug, browser)
    browser.find_element(class: "selected").click
      fail 'Did not meet expected result' unless(browser.find_element(link_text: issue_id_bug)).displayed?
        puts "All issue is visible on ‘Issues’ tab = OK"
  end
end