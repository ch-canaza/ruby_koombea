class LinksController < ApplicationController

    def index
        @links = Link.all
    end

    def new
        @link = Link.new
    end
    
    def show
    end

    #private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end
    
end
