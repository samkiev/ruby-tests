Given(/^I Create "([^"]*)" issue$/) do |subject_bug|
  create_bug_insue(@subject_issue["bug"], @version_name, @issue_value["bug"], @browser)
  @id["issue_id_bug"] = get_issue_id(@browser)
end

And(/^I should see new "([^"]*)" issue$/) do |issue_id|
  issue_id_bug = @browser.find_element(css: "#flash_notice > a").attribute("href")[-5, 5]
 message_is("Issue ##{issue_id_bug} created.", @browser)

end


Given(/^I Create "([^"]*)"  issue$/) do |subject_support|
  create_bug_insue(@subject_issue["support"], @version_name, @issue_value["support"], @browser)
  @id["issue_id_support"] = get_issue_id(@browser)
end

Given(/^I Create "([^"]*)" (\d+) issue$/) do |arg1, arg2|
  create_bug_insue(@subject_issue["feature"], @version_name, @issue_value["feature"], @browser)
  @id["issue_id_feature"] = get_issue_id(@browser)
end