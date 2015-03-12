require 'selenium-webdriver'
require 'page-object'


class RegisterNewPage
  include PageObject

    text_field(:new_login, :id => 'user_login')
    text_field(:password, :id => 'user_password')
    text_field(:password_confirm, :id => 'user_password_confirmation')
    text_field(:newuser_name, :id => 'user_firstname')
    text_field(:newuser_lastname, :id => 'user_lastname')
    text_field(:new_user_email, :id => 'user_mail')
    select_list(:language, :id => 'user_language')
    button(:commit, :name => "commit")

  def fields(data = {})
    populate_page_with DEFAULT_DATA.merge(data)
    commit
  end

end