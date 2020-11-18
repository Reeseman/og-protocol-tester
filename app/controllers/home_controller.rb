class HomeController < ApplicationController
	def index
    respond_to do |format|
      if params[:url].nil?
        format.html { render 'index' }
      else
        @data = HomeHelper.open_graph_data(params[:url])
        format.js
        format.html do
          redirect_to '/'
        end
      end
    end
	end
end
