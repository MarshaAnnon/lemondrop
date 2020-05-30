class QuotesController < ApplicationController

  
  def index
    @quotes = Quote.all
  end

  def new
    if params[:book_id]
      @book = Book.find_by_id(params[:book_id])
    end
  end

  def create
    @book = Book.find_by_id(params[:quote][:book_id])    
    @quote = @book.quotes.build(quote_params)
    if @quote.save
      redirect_to @book
    else
      render :new
    end
  end
  
  def show
    @quote = Quote.find_by_id(params[:id])
  end
  
  def edit
    @quote = Quote.find_by_id(params[:id])
  end

  def update
    @book = Book.find_by(params[:quote][:book_id])
    @quote = Quote.find_by_id(params[:id])
    @quote.update(quote_params)
      if @quote.errors.any?
        render "edit"
      else
        redirect_to @quote.book
      end
  end

  def destroy
    @quote = Quote.find_by_id(params[:id])
    @book = @quote.book
    @quote.destroy
    redirect_to @book
    flash[:notice] = "You have successfully deleted quote"
  end
  
    private
    
    def quote_params
      params.require(:quote).permit(:content, :user_id, :book_id)
    end

    
end
