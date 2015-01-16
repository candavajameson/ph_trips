module ApplicationHelper

	def page_header(text)
		content_for(:page_header) { text.to_s }
	end

	def random_css_mansory
		css = %w(col1 col2 col3)
		css[rand(ss.size)]
	end

	def truncate_content(content)
		"#{content[0..150]}..."
	end
end
