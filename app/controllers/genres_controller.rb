class GenresController < ApplicationController

  def new
    if params[:book_id]
      @book = Book.find_by_id(params[:book_id])
    end
  end

  def create
    @genre = @book.genres.build(genre_params)
    if @genre.save
      redirect_to @genre.book
    else
      render :new
    end
  end
     
  def show
    @genre = Genre.find_by_id(params[:id])
  end

  def update
    @genre = Genre.find_by_id(params[:id])
    @genre.update(genre_params)
      if @genre.errors.any?
        render "edit"
      else
        redirect_to @book
      end
  end

  private

  def genre_params
      params.require(:genre).permit(:name, :genre_id, :book_id)
  end

end

    
      
