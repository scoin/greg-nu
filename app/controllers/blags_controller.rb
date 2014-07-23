class BlagsController < ActionController::Base
	layout "application.haml"
	include TitleHelper

	def index
		params[:n] ||= 0
		@next_page = params[:n] + 1
		post_view_count = 4
		to_display = params[:n] * post_view_count
		@blags = Blag.includes(:images, :tags).limit(post_view_count).offset(to_display).order('updated_at desc')
	end

	def show
		@blag = Blag.find_by(slug: params[:slug])
		set_title(@blag.title)
	end

	def edit

	end

	def update

	end

	def new
		@blag = Blag.new
	end

	def create
		@blag = Blag.new(blag_params(params[:blag]))
		@blag.save
		redirect_to add_images_path id: @blag.id
	end

	def add_images

	end

	def destroy
	end

	private

	def blag_params(params)
    params.permit(:title, :content)
  end
end