class UsersController < ApplicationController
  protect_from_forgery
  def index
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    @book = Book.new
    @books= Book.all
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
      @user = User.find(params[:id])
      @user.id = current_user.id
    if @user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render edit_user_path(current_user.id)
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end                  
end
