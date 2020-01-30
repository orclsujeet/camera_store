class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
        t.string :email
	    t.string :password
	    t.string :mobile
	    t.string :name
	    t.string :access_token
	    t.boolean :is_active
	    t.timestamps null: false
    end
  end
end
