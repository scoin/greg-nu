class Blag < ActiveRecord::Base
	has_many :blagtags 
	has_many :tags, through: :blagtags
	has_many :images
	before_save :make_slug

	def get_paragraphs
		paragraphs = self.content.split("\r\n")
	end

	private
	def make_slug
		self.slug = self.title.gsub(/[!@#$%^&**();:'"\/\\.<>~`,]/, '').gsub(/ /,'-').downcase
	end
end
