require 'test_helper'

class LoginLogoutTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user cannot login without valid username and password" do
		user = User.create(username: "Lori", password: "password")

		visit login_path
		fill_in 'username', :with => nil
		fill_in 'password', :with => "password"

		click_link_or_button 'login'
		refute page.has_content?("Welcome #{user.username}")
		assert page.has_content?("Invalid entry")
  end

  test "valid user can logout of user page" do
		user = User.create(username: "Lori", password: "password")

		visit user_path(user)

		click_link_or_button 'logout'
		assert page.has_content?("Login to My Jams")
  end
	

end