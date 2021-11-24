class ArtistsController < ApplicationController
    before_action :set_artist, only: [:edit, :update, :destroy]

    def index
        @artist = Artist.all
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.new(artist_params)
        if @artist.save
            redirect_to artists_path, notice: 'An artist was successfully created.'
        else
            flash[:error] = "There are some errors encountered."
            render :new
        end
    end

    def edit
    end

    def update
        if @artist.update(artist_params)
            redirect_to artists_path, notice: 'An artist was successfully updated.'
        else
            flash[:error] = "There are some errors encountered."
            render :edit
        end
    end

    def destroy
        @artist.destroy
        redirect_to artists_path
    end

    private
    
    def set_artist
        @artist = Artist.find(params[:id])
    end
    
    def artist_params
        params.require(:artist).permit(:name, :avatar, :permalink, :bio, :formated_at, :verified, :verified_at, :avatar_url, :cover_photo_url)
    end
end
