class Session < ActiveRecord::Base
	belongs_to :user
	belongs_to :admin
end
