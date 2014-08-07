class BlagsController < ActionController::Base
	layout "application.haml"
	include TitleHelper
	include PageHelper

	def index
		params[:n] ||= 0
		get_pages(params[:n].to_i)
		@blags = Blag.includes(:images, :tags).limit(@post_view_count).offset(@to_display).order('updated_at desc')
		@blagcount = Blag.all.count
	end

	def show
		@blag = Blag.find_by(slug: params[:slug])
		@tags = @blag.tags
		# @paragraphs = @blag.get_paragraphs
		set_title(@blag.title)
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
		@content = markdown.render(@blag.content)
	end

	def bytag
		@tag = Tag.find_by(name: params[:tag])
		params[:n] ||= 0
		get_pages(params[:n].to_i)
		set_title("tagged with " + @tag.name)
		@blags = @tag.blags.includes(:images).limit(@post_view_count).offset(@to_display).order('updated_at desc')
		@blagcount = @tag.blags.count
		render :index
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
		blag = Blag.new(blag_params(params[:blag]))
		blag.save
		image = blag.images.new(image_params(params[:image]))
		image.save
		params[:tags].split(',').each do |tag|
			newtag = Tag.find_or_create_by(name: tag.strip)
			Blagtag.create(blag_id: blag.id, tag_id: newtag.id)
		end
		redirect_to root_path
	end

	def destroy
	end

	def search
		term = "%#{params[:search]}%"
		term = term.gsub(/ /, '-')
		get_pages(0)
		@blags = Blag.where("slug like ?", term).includes(:images, :tags).order('updated_at desc')
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
  		params.permit(:url)
  	end
end