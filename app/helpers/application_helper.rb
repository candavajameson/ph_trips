module ApplicationHelper

	def page_header(text)
		content_for(:page_header) { text.to_s }
	end

	def random_css_mansory
		css = %w(col3 col4 col5)
		css[rand(ss.size)]
	end

	def truncate_content(content)
		"#{content[0..150]}..."
	end

	def avatar_icon(user_email = '', size = nil)
		user = User.find_by(email: user_email)

		if user
			user.avatar_url(size) || default_avatar
		end
	end

	def default_avatar
		image_path('no_avatar.png')
	end

end
