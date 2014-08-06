class BlagsController < ActionController::Base
	layout "application.haml"
	include TitleHelper
	include PageHelper

	def index
		params[:n] ||= 0
		get_pages(params[:n].to_i)
		@blags = Blag.includes(:images, :tags).limit(@post_view_count).offset(@to_display).order('updated_at desc')
	end

	def show
		@blag = Blag.find_by(slug: params[:slug])
		@paragraphs = @blag.get_paragraphs
		set_title(@blag.title)
	end

	def edit

	end

	def update

	end

	def new
		@blag = Blag.new
		@image = Image.new
	end

	def create
		@blag = Blag.new(blag_params(params[:blag]))
		@blag.save
		params[:image][:blag_id] = @blag.id
		@image = Image.new(image_params(params[:image]))
		@image.save
		redirect_to root_path

	end

	def add_images
		puts params
		@image = Image.new
	end

	def save_images
		@image = Image.new(image_params(params[:image]))
		@image.save
		redirect_to root_path
	end

	def destroy
	end

	def search
		term = "%#{params[:search]}%"
		term = term.gsub(/ /, '-')
		get_pages(0)
		@blags = Blag.where("slug like ?", term).includes(:images, :tags).limit(@post_view_count).order('updated_at desc')
		if @blags.empty?
			render nothing: true
		elsif params[:search].length == 0
			render plain: "lol"
		else
			render partial: "blag", collection: @blags
		end
	end

	private

	def blag_params(params)
    	params.permit(:title, :content)
  	end

  	def image_params(params)
  		params.permit(:url, :blag_id)
  	end
end