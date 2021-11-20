class TracksController < ApplicationController
    before_action :set_track, only: [:edit, :update, :destroy]

    def index
        @tracks = Track.all
    end

    def new
        @tracks = Track.new
    end

    def create
        @tracks = Track.new(tracks_params)
        if @tracks.save
            redirect_to tracks_path, notice: 'An tracks was successfully created.'
        else
            flash[:error] = "There are some errors encountered."
            render :new
        end
    end

    def edit
    end

    def update
        if @tracks.update(tracks_params)
            redirect_to tracks_path, notice: 'An tracks was successfully updated.'
        else
            flash[:error] = "There are some errors encountered."
            render :edit
        end
    end

    def destroy
        @tracks.destroy
        redirect_to tracks_path
    end

    private
    
    def set_track
        @tracks = Track.find(params[:id])
    end
    
    def tracks_params
        params.require(:track).permit(:name)
    end
end
