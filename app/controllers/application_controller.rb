class ApplicationController < ActionController::Base
  def index
    @products = Product.all
    @reviews = Review.all
    render :index
  end
end
