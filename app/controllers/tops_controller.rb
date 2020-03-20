class TopsController < ApplicationController
  def index
    @products = Product.all.limit(3)
    @ladies = Product.where(Categorie_id: 1).limit(3)
    @parents = Category.where(ancestry: nil)
  end

  def buy
    @product = Product.find(1)
  end

  def product_soldout
    product.update(buyer_id: current_user.id)
    redirect_to root_path
  end

  def new
    @children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end
  
  

  def show
  end
end
