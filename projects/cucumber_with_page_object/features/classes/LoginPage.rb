
require 'selenium-webdriver'
require 'page-object'


class LoginPage
  include PageObject

  link(:goto_login_page, class: "login")
  text_field(:login, :id => 'username')
  text_field(:password, :id => 'password')
  button(:submit, :name => "login")

  def fields(data = {})
    populate_page_with DEFAULT_DATA.merge(data)
    submit
  end
end