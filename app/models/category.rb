class Category < ActiveRecord::Base
	belongs_to :admin
	has_many :products
	validates_presence_of :name,:category_type,:model
end
