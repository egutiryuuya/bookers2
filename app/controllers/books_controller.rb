class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(books_params)
    @book.user_id =current_user.id
    @book.save
    redirect_to books_path
  end  
    
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def show
    @book = Book.new
    @book_new = Book.find(params[:id])
    @user = current_user
    @users = @book_new.user
  end
  def edit
  end
  
  private
  def books_params
    params.require(:book).permit(:title, :body)
  end
end
