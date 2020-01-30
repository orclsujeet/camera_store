class Product < ActiveRecord::Base
	has_many :carts
	belongs_to :category
end
