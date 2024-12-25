class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @books = Book.new(book_params)
    @book = Book.new
    @user = current_user
    if @books.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      flash[:alert] = "Book was error created."
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @books = Book.find(params[:id])  
    @book = Book.new
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      flash[:alert] = "error updating book."
      render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
