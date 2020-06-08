class QuotesController < ApplicationController

  before_action :set_quote, only: [:show, :edit, :update, :delete]
  
  def index
    if params[:book_id]
      @book = Book.find_by_id(params[:book_id])
    end
    @quotes = Quote.all
    #@quotes = Quote.where("book_id = ?" params[:book_id])
  end

  def new
    if params[:book_id]
      @book = Book.find_by_id(params[:book_id])
    end
  end

  def create
    @quote = @book.quotes.build(quote_params)
    if @quote.save
      redirect_to @book
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end

  def update
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
    if params[:book_id]
      redirect_to @book
    else
      redirect_to quotes_path
      flash[:notice] = "You have successfully deleted quote"
    end
  end
  
  private
  
  def quote_params
    params.require(:quote).permit(:content, :user_id, :book_id)
  end
  
  def set_quote
    @quote = Quote.find_by_id(params[:id])
  end

end
