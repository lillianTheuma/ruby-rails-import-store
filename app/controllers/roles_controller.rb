class RolesController < ApplicationController

  def index
    if user_signed_in?
      @roles = []
      current_user.roles.each do |role|
        @roles.push role.name
      end
      @required_roles = ["Admin"] & @roles
    end
    if @required_roles = nil
      @required_roles = []
    end
    binding.pry
    if @required_roles.any?
      @roles = Role.all
      render :index
    else
      flash[:alert] = "Insufficient Priveleges."
      redirect_to '/'
    end
  end

  private
  def role_params
    params.require(:role).permit(:name, :description)
  end
end
