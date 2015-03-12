require 'selenium-webdriver'
require 'page-object'

class HomePage
include PageObject

  page_url ('http://demo.redmine.org')
  link(:register, class: "register")

end