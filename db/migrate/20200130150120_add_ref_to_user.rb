class AddRefToUser < ActiveRecord::Migration
  def change
  	add_reference :sessions, :user, index: true, foreign_key: false
  end
end
