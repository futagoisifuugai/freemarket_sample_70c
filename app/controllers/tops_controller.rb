class TopsController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end
end
