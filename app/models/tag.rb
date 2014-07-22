class Tag < ActiveRecord::Base
	has_many :blagtags
	has_many :blags, through: :blagtags
end
