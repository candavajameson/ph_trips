class Hotel < ActiveRecord::Base
	
	validates :name, presence: true
	validates :address, presence: true

	mount_uploader :banner, BannerUploader

	belongs_to :user
	belongs_to :destination
end