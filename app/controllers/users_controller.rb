class UsersController < ApplicationController
  def index
    if user_signed_in?
      @roles = []
      current_user.roles.each do |role|
        @roles.push role.name
      end
      @required_roles = ["Admin"] & @roles
    end
    if @required_roles == nil
      flash[:alert] = "Insufficient Priveleges."
      redirect_to '/'
    else
      if @required_roles.any?
      @users = User.all
      render :index
      else
      flash[:alert] = "Insufficient Priveleges."
      redirect_to '/'
      end
    end
  end

  def remove_role
    if user_signed_in?
      @roles = []
      current_user.roles.each do |role|
        @roles.push role.name
      end
      @required_roles = ["Admin"]
    end
    if @required_roles == nil
      flash[:alert] = "Insufficient Priveleges."
      redirect_to '/'
    else
      if @required_roles.any?
        @user = User.find(params[:user_id])
        @roles = []
        @user.roles.each do |role|
          @roles.push role.name
        end

        @role = Role.find(params[:role_id])
        if @roles.include?(@role.name)
          @user.roles.delete @role
          redirect_to user_path(@user)
        else
          flash[:alert] = "This user already has that role!"
          redirect_to user_path(@user)
        end
      else
        flash[:alert] = "Insufficient Priveleges."
        redirect_to '/'
      end
    end
  end

  def add_role
    if user_signed_in?
      @roles = []
      current_user.roles.each do |role|
        @roles.push role.name
      end
      @required_roles = ["Admin"]
    end
    if @required_roles == nil
      flash[:alert] = "Insufficient Priveleges."
      redirect_to '/'
    else
      if @required_roles.any?
        @user = User.find(params[:user_id])
        @roles = []
        @user.roles.each do |role|
          @roles.push role.name
        end
        @role = Role.find(params[:role_id])
        if @roles.include?(@role.name)
          flash[:alert] = "This user already has that role!"
          redirect_to user_path(@user)
        else
          @user.roles << @role
          redirect_to user_path(@user)
        end
      else
        flash[:alert] = "Insufficient Priveleges."
        redirect_to '/'
      end
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
