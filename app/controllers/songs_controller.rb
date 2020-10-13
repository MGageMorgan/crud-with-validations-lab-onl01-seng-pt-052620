class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    set_song
  end

  def edit
    set_song
  end

  def update
    set_song
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    # I deem this extremely important, if the project is anything like Sinatra's
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
