module PageHelper

	def get_pages(n = 0)
		@next_page = n + 1
		@prev_page = n - 1
		@post_view_count = 4
		@to_display = n * @post_view_count
	end

end