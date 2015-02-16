class Category < ActiveRecord::Base

	
	has_many :blog
	has_and_belongs_to_many :guides
	
	validates :name, presence: true
	validates :description, presence: true
end