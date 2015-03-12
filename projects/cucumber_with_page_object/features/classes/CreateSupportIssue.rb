

require 'selenium-webdriver'
require 'page-object'


class CreateSupportIssue
  include PageObject

  link(:new_issue, :class => 'new-issue')
  select_list(:issue_support, :id => 'issue_tracker_id')
  text_field(:login, :id => 'issue_subject')
  button(:commit, :name => "commit")

  def create_issue(data = {})
    new_issue
    populate_page_with DEFAULT_DATA.merge(data)
    commit
  end

end