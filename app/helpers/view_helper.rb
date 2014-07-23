module ViewHelper 
	def style_helper
		"background-image:url('#{@image}')" if @image
	end

end