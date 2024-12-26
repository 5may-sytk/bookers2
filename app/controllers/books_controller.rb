class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params) 
    # @book = Book.new
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
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
    # @books = Book.all
    @book_id = Book.find(params[:id])  
    @book = Book.new
    @user = @book_id.user
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
    params.require(:book).permit(:title, :body, :book_id)
  end

  def is_matching_login_user
    user = User.find(params[:id]) 
    unless user.id == current_use
      redirect_to user_path(current_user.id)
    end
  end

end
