class AlbumsController < ApplicationController
    before_action :set_album, only: [:edit, :update, :destroy]

    def index
        @albums = Album.all
    end

    def new
        @albums = Album.new
    end

    def create
        @albums = Album.new(albums_params)
        if @albums.save
            redirect_to albums_path, notice: 'An albums was successfully created.'
        else
            flash[:error] = "There are some errors encountered."
            render :new
        end
    end

    def edit
    end

    def update
        if @albums.update(albums_params)
            redirect_to albums_path, notice: 'An albums was successfully updated.'
        else
            flash[:error] = "There are some errors encountered."
            render :edit
        end
    end

    def destroy
        @albums.destroy
        redirect_to albums_path
    end

    private
    
    def set_album
        @albums = Album.find(params[:id])
    end
    
    def albums_params
        params.require(:album).permit(:name)
    end
end
