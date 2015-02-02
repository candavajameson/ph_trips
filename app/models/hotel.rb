class Hotel < ActiveRecord::Base
	
	validates :name, presence: true
	validates :address, presence: true

	belongs_to :user
	belongs_to :destination
end