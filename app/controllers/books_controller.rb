class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book1 = Book.find(params[:id])  
    @book = Book.new
    @user = current_user
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
