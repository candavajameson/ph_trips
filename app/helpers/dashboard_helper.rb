module DashboardHelper
	
	def randomized_css_mansory
		css = %w(col3 col4 col5)
		css[rand(css.size)]
	end
end