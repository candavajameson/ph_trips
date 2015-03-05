class Guide < ActiveRecord::Base

	mount_uploader :banner, BannerUploader
	
	validates :title, presence: true
	validates :description, presence: true

	belongs_to :user
	has_and_belongs_to_many :categories
	has_many :comments, as: :commentable, :dependent => :destroy
end