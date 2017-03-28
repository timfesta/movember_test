class MicropostsController < ApplicationController

	def index
		@micropost = Micropost.all
	end

	def create
		
	end
end
