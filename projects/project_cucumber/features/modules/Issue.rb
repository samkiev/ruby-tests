require_relative 'Verification'

module Issue

include(Verification)

#Create Bug insue
  def create_bug_insue(subject_bug, version_name, issue_val, browser)
    browser.find_element(class: "new-issue").click
    sleep 2
    Selenium::WebDriver::Support::Select.new(browser.find_element(:id, "issue_tracker_id")).
        select_by(:value, issue_val)
    browser.find_element(id: "issue_subject").send_keys subject_bug
    #browser.find_element(id: "issue_description").send_keys "Steps to reprosuce"
    #Selenium::WebDriver::Support::Select.new(browser.find_element(:id, "issue_status_id")).
    #    select_by(:value, "2")
    #Selenium::WebDriver::Support::Select.new(browser.find_element(:id, "issue_priority_id")).
    #   select_by(:value, "5")
    #Selenium::WebDriver::Support::Select.new(browser.find_element(:id, "issue_fixed_version_id")).
    #   select_by(:text, version_name)
    browser.find_element(name: "commit").click
  sleep 2

  end

end