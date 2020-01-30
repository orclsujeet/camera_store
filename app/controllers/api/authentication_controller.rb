class Api::AuthenticationController < ApplicationController
	skip_before_action :verify_authenticity_token
	def signup_user
    @user=User.new(user_params)
    if @user.save
      render json: {success: true, message:'Successfully Signup!', status:201}
    else
      render json: {errors: @user.errors,status:406}
    end
  end
  
	def login_user
		unless User.find_by_email(params[:email]).present?
            render json: { error: "It seems Email Id and/or password is/are not matched" }, status: 401
            return
        end
    command = AuthenticateUser.call(params[:email], params[:password])
	    if command.success?	
		    @session=Session.create(:user_id => command.result.id)
		    render json: {success: true, message: 'Logged in!', status:201,id:command.result.id, auth_token: command.result.access_token, email: command.result.email}
		else
		   render json: { success: false,status: :unauthorized}
		end
	end

    def logout_user
    	if current_user.present?
	      current_user.session.update(:user_id=>nil)
	      render json: current_user.update(:access_token=>nil)
	      return
	    end
	    render json: { error: 'Not Authorized' }, status: 401 unless current_user
        
        render json:{success: true, message: '"Logged out!"', status:201}
    end

    def signup_admin
    @admin=Admin.new(admin_params)
    if @admin.save
      render json: {success: true, message:'Successfully Signup!', status:201}
    else
      render json: {errors: @admin.errors,status:406}
    end
  end
  
	def login_admin
		unless Admin.find_by_email(params[:email]).present?
            render json: { error: "It seems Email Id and/or password is/are not matched" }, status: 401
            return
        end
    command = AuthenticateAdmin.call(params[:email], params[:password])
	    if command.success?	
		    @session=Session.create(:admin_id => command.result.id)
		    render json: {success: true, message: 'Logged in!', status:201,id:command.result.id, auth_token: command.result.access_token, email: command.result.email}
		else
		   render json: { success: false,status: :unauthorized}
		end
	end

    def logout_admin
    	if current_admin.present?
	      current_admin.session.update(:admin_id=>nil)
	      render json: current_admin.update(:access_token=>nil)
	      return
	    end
	    render json: { error: 'Not Authorized' }, status: 401 unless current_user
        
        render json:{success: true, message: '"Logged out!"', status:201}
    end

    protected

	def user_params
	    params.permit(:name,:email,:password)
	end
	def admin_params
	    params.permit(:name,:email,:password)
	end
end
