module TitleHelper

	def set_title(title)
		@title = title
	end

	def get_title
		"-- "+@title
	end

end