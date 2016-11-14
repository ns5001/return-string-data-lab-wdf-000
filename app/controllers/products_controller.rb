class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def description
    product = Product.find_by(id: params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find_by(id: params[:id])
    render plain: product.inventory > 0 ? true : false
  end

  def create
    @product = Product.create(product_params)
    @product.save
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :inventory)
  end

end
