class BookGenresController < ApplicationController
    
    before_action :set_bookgenre, only: [:show, :edit, :update]

    def index
        if params[:book_id][:genre_id]
          @book = Book.find_by_id(params[:book_id])
        end
        @bookgenres = BookGenre.all
    end
    
    def new
        if params[:book_id][:genre_id]
          @book = Book.find_by_id(params[:book_id])
        end
    end
    
    def create
        @book = Book.find_by_id(params[:book_genre][:book_id])    
        @bookgenre = @book.book_genres.build(bookgenre_params)
        binding.pry
        if @bookgenre.save
            
          redirect_to @bookgenre.book
        else
          render :new
        end
    end
      
    def show
    end
    
    def edit
    end
    
    def update
        @book = Book.find_by(params[:book_genre][:book_id])
        @bookgenre.update(bookgenre_params)
        if @bookgenre.errors.any?
            render "edit"
        else
            redirect_to @bookgenre.book
        end
    end
    
    #def destroy
    #    @book = @bookgenre.book
    #    @bookgenre.destroy
    #    redirect_to @book
    #    flash[:notice] = "You have successfully deleted sub-genre"
    #end
      
private
        
    def bookgenre_params
        params.require(:book_genre).permit(:sub_genre, :genre_id, :book_id)
    end
    
    def set_bookgenre
        @bookgenre = BookGenre.find_by_id(params[:id])
    end
     
end
