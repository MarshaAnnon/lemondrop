class BooksController < ApplicationController

    def show
        @book = book.find_by_id(params[:id])
      end
    
      def index
        @books = book.all
      end
    
      def new
        @book = book.new
      end
    
      def create
        book = book.new(book_params)
        book.save
        redirect_to book
      end
    
      private
    
      def book_params
        params.require(:book).permit(:title, :author, :description, genre_ids:[], genres_attributes: [:name])
      end
    
    end
end
