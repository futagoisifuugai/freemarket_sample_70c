class TestsController < ApplicationController

  def index
  end

  def show
    @parents = Category.where(ancestry: nil)
  end
end
