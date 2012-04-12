class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    page = params[:page] || 1
    @products = Product.order(:created_at).page(page)

    respond_to do |format|
      format.html
      format.json { render json: @products }
    end
  end
  
end
