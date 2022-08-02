class UsersController < ApplicationController
  before_action :correct_user,only:[:edit,:update]
  protect_from_forgery
 
  
  def index
   @users = User.all
   @user = current_user
  end

  def show
    @user = current_user
    @books = @user.books
    @users = User.all
    @book = Book.new
    @users = User.find(params[:id])
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
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end              
  
  def correct_user
    redirect_to(user_path(current_user.id)) unless @user==current_user
  end
    
  
  
end
