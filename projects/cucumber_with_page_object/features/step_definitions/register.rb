


Given(/^I field Register Fields$/) do
  on(RegisterPage).fields
  @id["id_first_user"] = get_user_id(@browser)
end

When(/^I should be registered$/) do
  message_is(('Ваша учётная запись активирована. Вы можете войти.')||('Your account has been activated. You can now log in.'), @browser)

end

But(/^I repeate Registration procedure with new registration data$/) do
 on(RegisterNewPage).fields
  @id["id_second_user"] = get_user_id(@browser)
end