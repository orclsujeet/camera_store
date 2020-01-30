class User < ActiveRecord::Base
	has_secure_password
	before_create :generate_access_token, :default_is_active
    before_update :generate_access_token
    validates :email, presence: true, uniqueness: true 

    has_one :session
    has_one :cart

    protected
    #generates access token used for authentication
    def generate_access_token
	    begin
	      self.access_token = SecureRandom.hex
	    end while self.class.exists?(access_token: access_token)
	end

    # set default is_active value to 0
    def default_is_active
	    self.is_active||=1
    end
end
