class BlagsController < ActionController::Base
	layout "application.haml"
	include TitleHelper
	include SearchHelper
	include PageHelper

	def index
		n ||= params[:n].to_i
		n ||= 0
		get_pages(n)
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
		get_pages(params[:n].to_i)
		@blags = Blag.where("slug like ?", term).includes(:images, :tags).limit(@post_view_count).order('updated_at desc')
		unless @blags.empty?
			render partial: "blag", collection: @blags
		else
			puts "i'm here"
			@blags = Blag.includes(:images, :tags).limit(@post_view_count).offset(@to_display).order('updated_at desc')
			render "index", layout: false, locals:{n: params[:n]}
		end
	end

	private

	def blag_params(params)
    params.permit(:title, :content)
  end
end