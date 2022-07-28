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
    @user = User.new
    @user.id = current_user.id
    @user.save(user_params)
    redirect_to user_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:introduction,:image)
  end
end
