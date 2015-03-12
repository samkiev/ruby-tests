Given(/^I Create "([^"]*)" issue$/) do |subject_bug|
  on(CreateBugIssue).create_issue
  @id["issue_id_bug"] = get_issue_id(@browser)
end

And(/^I should see new "([^"]*)" issue$/) do |issue_id|
  issue_id_bug = @browser.find_element(css: "#flash_notice > a").attribute("href")[-5, 5]
 message_is("Issue ##{issue_id_bug} created.", @browser)

end

Given(/^I Create "([^"]*)"  issue$/) do |subject_support|
  on(CreateSupportIssue).create_issue
  @id["issue_id_support"] = get_issue_id(@browser)
end

Given(/^I Create "([^"]*)" (\d+) issue$/) do |arg1, arg2|
  on(CreateFeatureIssue).create_issue
  @id["issue_id_feature"] = get_issue_id(@browser)
end