class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    page = params[:page] || 1
    @products = Product.order(:created_at).page(page)

    respond_to do |format|
      format.html
      format.json do
        render json: @products.map { |p| view_context.product_for_template(p) }
      end
    end
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
end
