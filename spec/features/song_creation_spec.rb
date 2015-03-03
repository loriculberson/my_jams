require 'rails_helper'

RSpec.describe "User creates a song" do
  context "with valid attributes" do
    it "saves and displays the song title" do
      visit new_song_path
      fill_in 'Title', :with => 'Walking on Sunshine'
   		fill_in 'Artist', :with => 'Katrina and the Waves'

   		click_link_or_button 'Create Song'
      expect(page).to have_content('Walking on Sunshine')
    end
  end
end