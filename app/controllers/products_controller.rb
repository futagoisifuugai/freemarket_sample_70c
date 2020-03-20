class ProductsController < ApplicationController

  def index
    @products = Product.includes(:images).order('created_at DESC')
    @product = Product.new
    4.times { @product.images.build }
    @product.images.new
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.name
    end
  end

  def show
  end

  def new
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.name
    end
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      4.times { @product.images.build }
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
    params.require(:product).permit(:name, :category_id, :brand_id, :price, :description, :condition_id, :postage_burden, :sending_method_id, :area_id, :scheduled_sending_date, :size, images_attributes: [:image_url]).merge(seller_id: current_user.id)
  end

end
