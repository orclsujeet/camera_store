class AuthenticateAdmin
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  
  def call
    return admin if admin
  end

  private

  attr_accessor :email, :password

  def admin
    admin = Admin.find_by_email(email)
    return admin if admin && admin.authenticate(password)
    # return admin if admin

    errors.add :admin_authentication, 'invalid credentials'
    nil
  end
end