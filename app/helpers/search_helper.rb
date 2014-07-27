module SearchHelper

	def get_article(search_terms)
		@blags = Blag.all.where
	end

	def get_paragraphs
		paragraphs = @blag.content.split("\\r\\n")
	end

end