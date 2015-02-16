class Category < ActiveRecord::Base

	has_and_belongs_to_many :guides
	has_many :blog
end