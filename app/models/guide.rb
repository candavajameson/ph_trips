class Guide < ActiveRecord::Base

	belongs_to :user
	has_and_belongs_to_many :categories

	mount_uploader :banner, BannerUploader
	
	validates :title, presence: true
	validates :description, presence: true
end