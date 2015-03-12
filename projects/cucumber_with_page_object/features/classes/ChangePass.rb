require 'selenium-webdriver'
require 'page-object'


class ChangePass
  include PageObject

  link(:goto_my_account, class: "my-account")
  link(:change_pass_link, class: "icon-passwd")
  text_field(:password, :id => 'password')
  text_field(:new_password, :id => 'new_password')
  text_field(:new_password_confirm, :id => 'new_password_confirmation')
  button(:commit, :name => "commit")

  def fields(data = {})
    goto_my_account
    change_pass_link
    populate_page_with DEFAULT_DATA.merge(data)
     commit
  end
end