class Blog < ActiveRecord::Base

	validates :title, presence: true
	validates :content, presence: true
	validates :excerpt, presence: true

	mount_uploader :banner, BannerUploader

	belongs_to :user
	belongs_to :category
	has_many :comments, as: :commentable, :dependent => :destroy
end