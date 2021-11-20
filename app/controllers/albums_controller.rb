class AlbumsController < ApplicationController
    before_action :set_album, only: [:edit, :update, :destroy]

    def index
        @albums = Artist.all
    end

    def new
        @albums = Artist.new
    end

    def create
        @albums = Artist.new(albums_params)
        if @albums.save
            redirect_to artists_path, notice: 'An albums was successfully created.'
        else
            flash[:error] = "There are some errors encountered."
            render :new
        end
    end

    def edit
    end

    def update
        if @albums.update(albums_params)
            redirect_to artists_path, notice: 'An albums was successfully updated.'
        else
            flash[:error] = "There are some errors encountered."
            render :edit
        end
    end

    def destroy
        @albums.destroy
        redirect_to artists_path
    end

    private
    
    def set_artist
        @albums = Artist.find(params[:id])
    end
    
    def artist_params
        params.require(:albums).permit(:name, :permalink, :bio)
    end
end
