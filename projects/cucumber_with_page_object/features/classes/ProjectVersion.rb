
require 'selenium-webdriver'
require 'page-object'


class ProjectVersion
  include PageObject

  link(:tab_versions, id: "tab-versions")
  link(:goto_add_link, text: "New version")
 # link(:goto_add_link, class: "icon-add")
  text_field(:project_version_name, :id => 'version_name')
  button(:commit, :name => "commit")

  def add_version(data = {})
    tab_versions
    goto_add_link
    populate_page_with DEFAULT_DATA.merge(data)
    commit
  end
end