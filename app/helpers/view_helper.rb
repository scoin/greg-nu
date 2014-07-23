module ViewHelper 
	def bgimage(image)
		"background-image:url('#{image}')" if image
	end

end