class ForumPost < ActiveRecord::Base
	belongs_to :user
	belongs_to :forum_thread

	validates :body, presence: true
end
