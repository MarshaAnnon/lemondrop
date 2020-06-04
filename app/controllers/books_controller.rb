class BooksController < ApplicationController

  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.book_description
  end
  
  def new
    @book = current_user.books.build
    @book.quotes.build
    @book.genres.build
    @book.book_genres.build
  end
  
  def create
    @user_book = current_user.user_books.build
    @book = Book.new(book_params)
    if @book.save
      
      @user_book.book = @book
      @user_book.current_book = params[:book][:current_book]
      @user_book.save
      @book_genre = @book.book_genres.last
      @book_genre.sub_genre = params[:book][:book_genre][:sub_genre]
      @book_genre.save
      binding.pry
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
          redirect_to @book
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
    params.require(:book).permit(:title, :author, :description, :genre_ids, genres_attributes: [:name, :genre_id], quotes_attributes: [:content], book_genres_attributes: [:sub_genre, :book_id, :genre_id])
  end

  def set_book
    @book = Book.find_by_id(params[:id])
  end
    
end
