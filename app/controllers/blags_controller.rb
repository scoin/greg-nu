class BlagsController < ActionController::Base
	layout "application.haml"
	include TitleHelper
	include SearchHelper
	include PageHelper

	def index
		params[:n] ||= 0
		get_pages(params[:n].to_i)
		@blags = Blag.includes(:images, :tags).limit(@post_view_count).offset(@to_display).order('updated_at desc')
	end

	def show
		@blag = Blag.find_by(slug: params[:slug])
		@paragraphs = get_paragraphs
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

	def search
		term = "%#{params[:search]}%"
		term = term.gsub(/ /, '-')
		get_pages(0)
		@blags = Blag.where("slug like ?", term).includes(:images, :tags).limit(@post_view_count).order('updated_at desc')
		unless @blags.empty? || params[:search].length == 0
			render partial: "blag", collection: @blags
		else
			render nothing: true
		end
	end

	private

	def blag_params(params)
    params.permit(:title, :content)
  end
end