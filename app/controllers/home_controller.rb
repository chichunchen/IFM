class HomeController < ApplicationController
	before_action :search, only: [:index]

	def index		
	end

	private 

	def search
      if params[:search].present?
        redirect_to :controller => 'books', :action => 'index', :search => params[:search]
      end
    end
end
