class VendorsController < ApplicationController
  def show
    @vendor = Vendor.find(params[:id])
    render :show
  end

  def edit
    @vendor = Vendor.find(params[:id])
    render :edit
  end


  def update
    @vendor = Vendor.find(params[:id])
    if @vendor.update(vendor_params)
      flash[:notice] = "Vendor updated."
      redirect_to vendor_path(@vendor)
    else
      flash[:alert] = "Vendor update failed."
      render :edit
    end
  end
  private
    def vendor_params
      params.require(:vendor).permit(:name, :description)
    end
end
