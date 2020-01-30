class Api::CartController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
        @carts = Cart.all.where(user_id: current_user.id)
    end

    def create_cart
    	@product = Product.find(params[:id])
    	@cart = Cart.new 
        @cart.product_id = @product.id
        @cart.user_id = current_user.id
        if @cart.save
            render json:{success: true, message: 'saved successfully', status:201}
        else
            render json:{errors: @cart.errors.full_messages, status: 406}
        end 
    end

end
