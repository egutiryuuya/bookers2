class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end
  
  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_comment=Bookcomment.new
    
  end
  
  def edit
    @book = Book.find(params[:id])
    if @book.user_id==current_user.id
      render :edit
    else
      redirect_to books_path
    end
  end
  
  def create
      @books = Book.all
      @user = current_user
      @book = Book.new(books_params)
      @book.user_id =current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @user = current_user
      flash[:alert] = "error"
      render :index
    end
  end  
  
  def update
      @book = Book.find(params[:id])
    if  @book.update(books_params)
      redirect_to book_path(@book.id),notice: "You have updated book successfully."
    else
      flash[:alert]="error"
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  def books_params
    params.require(:book).permit(:title,:body)
  end
  
end
