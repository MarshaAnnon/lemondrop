class BooksController < ApplicationController

  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = book.all
  end
    
  def new
    @book = current_user.books.build
  end
    
  def create
    @book = current_user.books.build(book_params)
    if @book.save
      @book.quotes.build
      current_user.books << @book
      redirect_to book_path(@book)
    else
      redirect_to root_path
    end
  end

  def show
    if !@book
      redirect_to books_path
    end
  end
      
    
  private
  
  def book_params
    params.require(:book).permit(:title, :author, :description, genre_id:[],genres_attributes: [:name])
  end

  def set_book
    @book = Book.find_by_id(params[:id])
  end
    
end
