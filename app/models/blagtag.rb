class Blagtag < ActiveRecord::Base
	belongs_to :blag 
	belongs_to :tag
end
