class Category < ActiveRecord::Base

	
	has_many :blog
	has_and_belongs_to_many :guides
	
	validates :name, presense: true
	validates :description, presense: true
end