class AddRefs < ActiveRecord::Migration
  def change
  	add_reference :categories, :admin, index: true, foreign_key: false
  	add_reference :products, :admin, index: true, foreign_key: false
  	add_reference :products, :category, index: true, foreign_key: false
  	add_reference :carts, :user, index: true, foreign_key: false
  	add_reference :carts, :product, index: true, foreign_key: false
  end
end
