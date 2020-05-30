class QuotesController < ApplicationController

  before_action :set_quote, only: [:show, :edit, :update, :destroy]
  
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
    if !@quote
      redirect_to books_path
    end
  end
  
  def edit
  end

  def update
    @book = Book.find_by(params[:quote][:book_id])
    @quote.update(quote_params)
      if @quote.errors.any?
        render "edit"
      else
        redirect_to @book
      end
  end

  def destroy
    @quote.destroy
    redirect_to books_path
    flash[:notice] = "You have successfully deleted quote"
  end
  
    private
    
    def quote_params
      params.require(:quote).permit(:content, :user_id, :book_id)
    end

    def set_quote
      @quote = Quote.find_by_id(params[:id])
    end
    

end
