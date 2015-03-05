require 'selenium-webdriver'
require 'rspec'

module Verification

#Check message
  def message_is(message, browser)
  expect(browser.find_element(id: 'flash_notice').text).to eql message

  end


#check text for Verification of login

  def message_is_login(message, browser)

    expect(browser.find_element(class: "active").text).to eql message
  end

#Check result of add mew user"

  def check_add_user(name_new_user, browser)
   expect(browser.find_element(partial_link_text: name_new_user)).to be_truthy
  end

#Check text for Verification of change roles

  def check_role_user_message(message, project_user_id, browser)
    expect(browser.find_element(id: "member-#{project_user_id}-roles").text).to eql message
  end

#Check result of creation Version name"

  def check_create_version(version_name, browser)
    expect(browser.find_element(partial_link_text: version_name)).to be_truthy
  end

#Check of issue visible
  def check_displayed_issue(issue_id_bug, browser)
    browser.find_element(class: "selected").click
      expect(browser.find_element(link_text: issue_id_bug)).to be_truthy

  end
end