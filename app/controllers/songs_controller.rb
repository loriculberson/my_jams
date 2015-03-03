class SongsController < ApplicationController

	before_action :set_song, only: [:show, :update, :edit, :destroy]

	def index
		@songs = Song.all
	end

	def show
		# @song = Song.find(params[:id])
	end

	def new
		#making @song the same as Song.new because the edit.html and new.html.erb files have shared info
		@song = Song.new
	end

	def create
		song = Song.new(song_params)	
		if song.save
			redirect_to song
		else
			#return to the page where you tried to enter a song but must have missed one of the parameters
			render :new
		end
	end

	def edit
		# @song = Song.find(params[:id])
	end

	def update
		# @song = Song.find(params[:id])
		if @song.update(song_params)
			redirect_to @song
		else
			render :edit
		end		
	end

	def destroy
		# @song = Song.find(params[:id])
		@song.destroy
		redirect_to songs_path
		
	end

	private
	#refactoring the use of @song = Song.find(params[:id])
	def set_song
		@song = Song.find(params[:id])
	end

	def song_params
		#strong params
		params.require(:song).permit(:title, :artist)
	end
end