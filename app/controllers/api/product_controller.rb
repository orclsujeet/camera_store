class Api::ProductController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
        @products = Product.all
    end

    def show
    	@category = Category.find(params[:id])
        @products = Product.all.where(category_id: @category.id)
    end

    def create_product
    	@category = Category.find(params[:id])
    	@product = Product.new(product_params) 
        @product.category_id = @category.id
        if @product.save
            render json:{success: true, message: 'saved successfully', status:201}
        else
            render json:{errors: @product.errors.full_messages, status: 406}
        end 
    end

protected

def product_params
  params.permit(:name,:description,:make,:price)
end 
end
