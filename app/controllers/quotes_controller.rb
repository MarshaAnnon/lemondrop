class QuotesController < ApplicationController

  def new
  end

  def create
    quote = Quote.new(quote_params)
    quote.save
    redirect_to book_path
  end
  
  def update
    if @quote
      @quote.update(quote_params)
        if @quote.errors.any?
          render "edit"
        else
          redirect_to book_path
        end
    else
      render "edit"
    end
  end

  def destroy
      @quote.destroy
      redirect_to root_path
      flash[:notice] = "You have successfully deleted quote"
  end
  
    private
    
    def quote_params
      params.require(:quote).permit(:content, :user_id, :book_id)
    end
    

end
