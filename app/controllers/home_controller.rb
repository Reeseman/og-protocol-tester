class HomeController < ApplicationController
	def index
    respond_to do |format|
      if params[:url].nil?
        format.html { render 'index' }
      else
        @value = 'real data'
        format.js
        format.html do
          redirect_to '/'
        end
      end
    end
	end
end
