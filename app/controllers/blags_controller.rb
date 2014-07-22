class BlagsController < ActionController::Base

	def index
		params[:n] ||= 1
		post_view_count = 10
		to_display = params[:n] * post_view_count
		@blags = Post.all.limit(to_display).offset(to_display - post_view_count)
	end

	def show
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