
require 'selenium-webdriver'
require 'page-object'


class AddNewUser
  include PageObject

  link(:goto_members_tab, id: "tab-members")
  link(:new_member_link, class: "icon-add")
  text_field(:newuser_name, id: "principal_search")
  checkbox(:add_user, :id => "#principals>label>input[value='#{@id}']")
  text_field(:login, :id => 'project_description')
  checkbox(:project_inherit_members, :id => 'project_inherit_members')
  button(:commit, :name => "commit")

  # browser.find_element(id: "tab-members").click
  # browser.find_element(id: "principal_search").send_key(name_new_user)
  # sleep 2
  # browser.find_element(css: "#principals>label>input[value='#{user_id}']").click
  # browser.find_element(css: "#new_membership>fieldset>p>label>input[value='5']").click
  # browser.find_element(css: "#new_membership>fieldset>p>label>input[value='4']").click
  # browser.find_element(id: "member-add-submit").click

  def get_id_user(id)
    return id
  end
  def add_project(data = {},user_id)
    goto_members_tab
    new_member_link
    sleep 5
    populate_page_with DEFAULT_DATA.merge(data)
    @id = get_id_user(user_id)
    check_adduser
    commit
  end
end