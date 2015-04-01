require 'test_helper'

class SongCreationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

 	test "user can create a song" do 
		user = User.create!(username: "Wendy", password: "password")
		ApplicationController.any_instance.stubs(:current_user).returns(user)
   visit new_song_path 
   fill_in 'Title', :with => 'Walking on Sunshine'
   fill_in 'Artist', :with => 'Katrina and the Waves'

   click_link_or_button 'Create Song'
   	# within('#songs') do -- this is the id in the 
   assert page.has_content?("Walking on Sunshine")
 	# end
 end


 #As a valid user, I want to login to my page


 


end

 #I want to see my song list
 #and be able to create new songs, delete and edit 
 #be able to logout