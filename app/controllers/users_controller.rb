class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  protect_from_forgery
 
  
  def index
   @users = User.all
   @user = current_user
   @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @users = User.all
    @book = Book.new
   
  end

  def edit
       @user = User.find(params[:id])
    if @user==current_user
       render :edit 
    else
      @user = current_user
      redirect_to user_path(@user.id)
    end
  end
  
  def update
       @user = User.find(params[:id])
       @user.id = current_user.id
    if @user.update(user_params)
       flash[:notice]= "You have updated user successfully."
       redirect_to user_path(@user)
    else
       flash[:alert]= "name error"
       render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end              
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) ,notice: 'ゲストユーザーはプロフィール編集画面に遷移できません'
    end
  end
end
