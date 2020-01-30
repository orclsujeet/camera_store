class Api::CategoryController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
        @categories = Category.all
    end

    def create
    	@category = Category.new(category_params)
        @category.admin_id = current_admin.id
        if @category.save
            render json: {success: true, message: 'created successfully', status: 201}
        else
            render json: {success: false, errors: @category.errors.full_messages, status: 406}
        end
	    
    end

protected

def category_params
  params.permit(:name,:category_type,:model)
end 

end
