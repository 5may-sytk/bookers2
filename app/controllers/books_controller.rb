class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = PostImage.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @books = Book.all
  end

  def show
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
