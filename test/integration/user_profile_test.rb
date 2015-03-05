require 'test_helper'

class UserProfileTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  attr_reader:user

  def setup
    @user = User.create(username: 'Richard', password: 'LaBamba')
  end

  test "registered user can view their profile" do
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit user_path(user)
    within("#banner") do
      assert page.has_content?("Richard's Music List")
    end
  end

  test "unregistered user cannot view a user's profile" do
    ApplicationController.any_instance.stubs(:current_user).returns(nil)
    visit user_path(user)
    within("#flash_alert") do
      assert page.has_content?("Not authorized")
    end
  end

  test "registered user cannot view other users' profile" do
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    #overriding current user (From application controller) instead use the user created in the setup
    #the user is the current_user but we don't want them to have access to anyone elses page
    protected_user = User.create(username: "Protected",  password: "password", password_confirmation: "password")
    visit user_path(protected_user)
    within("#flash_dumbass") do
      assert page.has_content?("You are not authorized to access this page")
    end
  end

  test "an admin user can view any user's profile" do
    admin_user = User.create(username: "admin",  password: "password", password_confirmation: "password", role: "admin")
    ApplicationController.any_instance.stubs(:current_user).returns(admin_user)
    visit user_path(user)
    within("#banner") do
      save_and_open_page
      assert page.has_content?("Richard's Music List")
    end
  end

end