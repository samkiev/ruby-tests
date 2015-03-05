include Register




Given(/^I field Register Fields$/) do
  create_account(@login, @password, @name, @browser)
  @id["id_first_user"] = get_user_id(@browser)
end

When(/^I should be registered$/) do
  message_is(('Ваша учётная запись активирована. Вы можете войти.')||('Your account has been activated. You can now log in.'), @browser)

end

But(/^I repeate Registration procedure with new registration data$/) do
  create_account(@new_user_login, @new_password, @name_new_user, @browser)
  @id["id_second_user"] = get_user_id(@browser)
end