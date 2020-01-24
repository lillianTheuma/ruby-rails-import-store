class ProductsController < ApplicationController

  def index
    @products = Product.all
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Product creation failed."
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
    render :show
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end


  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product updated."
      redirect_to product_path(@product)
    else
      flash[:alert] = "Product update failed."
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to application_path()
  end

  private
    def product_params
      params.require(:product).permit(:name, :country_of_origin, :cost, :vendor_id)
    end
end
