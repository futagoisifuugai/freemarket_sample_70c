class ProductsController < ApplicationController

  def index
    @products = Product.includes(:images).order('created_at DESC')
    @product = Product.new
    5.times { @product.images.build }
    @product.images.new
  end

  def show
      
  end

  def new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :index
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

def product_params
  params.require(:product).permit(:name, :category_id, :brand_id, :price, :description, :condition_id, :postage_burden, :sending_method_id, :area_id, :scheduled_sending_date, :size, images_attributes: [:src])
end

end
