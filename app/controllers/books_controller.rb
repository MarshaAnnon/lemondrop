class BooksController < ApplicationController

  before_action :set_book, only: [:show, :edit]

  def index
    @book = Book.all
    @books = Book.book_description
    @books = Book.book_title(params[:title]) if params[:title].present?
  end

  def new
    @book = current_user.books.build
    @book.quotes.build
    @book.genres.build
    @book.book_genres.build
    @book.user_books.build
  end
  
  def create
      @book = current_user.books.build(book_params)
      if @book.save
          redirect_to @book
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
    @book = Book.find_by_id(params[:id])
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
    @book = Book.find_by_id(params[:id])
    @book.destroy
    redirect_to book_path
    flash[:notice] = "You have successfully deleted book"
  end

  private
  
  def book_params
    params.require(:book).permit(
      :title, 
      :author, 
      :description, 
      :genre_ids,
      :book_title, 
      :genres_attributes => [:id, :name, :genre_id], 
      :quotes_attributes => [:id, :content, :_destroy], 
      :book_genres_attributes => [:id, :book_id, :genre_id],       
      :user_books_attributes => [:id, :user_id, :book_id, :current_book]
      )
  end

  def set_book
    @book = Book.find_by_id(params[:id])
  end
    
end