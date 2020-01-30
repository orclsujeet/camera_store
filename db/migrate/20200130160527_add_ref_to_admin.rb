class AddRefToAdmin < ActiveRecord::Migration
  def change
  	add_reference :sessions, :admin, index: true, foreign_key: false
  end
end
