class Blag < ActiveRecord::Base
	has_many :blagtags 
	has_many :tags, through: :blagtags
	has_many :images
end
