class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render :show
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User updated."
      redirect_to user_path(@user)
    else
      flash[:alert] = "User update failed."
      render :edit
    end
  end
  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
