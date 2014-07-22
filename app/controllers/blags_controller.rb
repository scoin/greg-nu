class BlagsController < ActionController::Base
	layout "application.haml"
	include TitleHelper

	def index
		params[:n] ||= 1
		post_view_count = 10
		to_display = params[:n] * post_view_count
		@blags = Blag.includes(:images, :tags).limit(to_display).offset(to_display - post_view_count).order('updated_at desc')
	end

	def show
		@blag = Blag.find_by(slug: params[:slug])
		set_title
	end

	def edit
	end

	def update
	end

	def new
	end

	def create
	end

	def destroy
	end


end