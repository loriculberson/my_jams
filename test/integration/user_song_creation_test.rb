	require 'test_helper'

class UserSongCreationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

		test "a created song belongs to a logged in user" do 
			user = User.create!(username: "Wendy", password: "password")
			song = Song.create(title: "Let It Be", artist: "The Beatles", user_id: user.id)

			assert_equal "Let It Be", song.title
			assert_equal  user.id, song.user_id 
		end

end