class RolesController < ApplicationController

  def index
    @roles = Role.all
    render :index
  end

  def new
    @role = Role.new
    render :new
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      flash[:notice] = "Role successfully added!"
      redirect_to role_path(@role)
    else
      flash[:alert] = "Role creation failed."
      render :new
    end
  end

  def edit
    @role = Role.find(params[:id])
    render :edit
  end


  def update
    @role = Role.find(params[:id])
    if @role.update(role_params)
      flash[:notice] = "Role updated."
      redirect_to role_path(@role)
    else
      flash[:alert] = "Role update failed."
      render :edit
    end
  end
  private
  def role_params
    params.require(:role).permit(:name, :description)
  end
end
