class BooksController < ApplicationController

  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end
    
  def new
    @book = current_user.books.build
    @book.quotes.build
    @book.genres.build
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to book_path(@book)
        if @book.errors.any?
          render "edit"
        end
    else
      render :new
    end
  end

  def show
    if !@book
      redirect_to books_path
    end
  end

  def edit
    if !@book
        redirect_to books_path
    end
  end

  def update
    if @book
        @book.update(book_params)
        if @book.errors.any?
            render "edit"
        else
            redirect_to book_path
        end
    else
        render "edit"
    end
  end

  def destroy
      @book.destroy
      redirect_to book_path
  end

  private
  
  def book_params
    params.require(:book).permit(:title, :author, :description, :genre_ids, genres_attributes: [:name, :genre_id], quotes_attributes: [:content])
  end

  def set_book
    @book = Book.find_by_id(params[:id])
  end
    
end
