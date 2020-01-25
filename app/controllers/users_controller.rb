class UsersController < ApplicationController
  def index
    if user_signed_in?
      @roles = []
      current_user.roles.each do |role|
        @roles.push role.name
      end
    end
    @required_roles = ["Admin"] & @roles
    if @required_roles.any?
      @users = User.all
      render :index
    else
      flash[:alert] = "Insufficient Priveleges."
      redirect_to application_path
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
