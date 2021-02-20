class LinksController < ApplicationController

    def index
        @links = Links.all
    end

    def new
        @link = Links.new
    end
    
    def show
    end

    #private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Links.find(params[:id])
    end
    
end
