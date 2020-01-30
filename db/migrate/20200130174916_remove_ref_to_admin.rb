class RemoveRefToAdmin < ActiveRecord::Migration
  def change
  	remove_reference :products, :admin, index: true, foreign_key: false
  end
end
