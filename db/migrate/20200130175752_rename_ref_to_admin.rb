class RenameRefToAdmin < ActiveRecord::Migration
  def change
  	rename_column :categories, :type, :category_type
  end
end
