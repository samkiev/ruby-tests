
require 'selenium-webdriver'
require 'page-object'


class CreateProjectPage
  include PageObject

  link(:goto_project_page, class: "projects")
  link(:goto_add_projectpage, class: "icon-add")

  text_field(:project_name, :id => 'project_name')
  text_field(:login, :id => 'project_description')
  checkbox(:inherit, :id => 'project_inherit_members')
  button(:commit, :name => "commit")

  def add_project(data = {})
    goto_project_page
    goto_add_projectpage
    populate_page_with DEFAULT_DATA.merge(data)
    check_inherit
    commit
  end
end