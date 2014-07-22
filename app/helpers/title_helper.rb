module TitleHelper

	def set_title(title = @blag.title)
		@title = title
	end

	def get_title
		"-- "+@title
	end

end