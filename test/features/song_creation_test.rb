require 'test_helper'

class SongCreationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

 	test "user can create a song" do 
   visit new_song_path 
   fill_in 'Title', :with => 'Walking on Sunshine'
   fill_in 'Artist', :with => 'Katrina and the Waves'

   click_link_or_button 'Create Song'
   	# within('#songs') do -- this is the id in the 
   assert page.has_content?("Walking on Sunshine")
 	# end
 end

 


end