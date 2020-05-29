class QuotesController < ApplicationController

    def create
        quote = Quote.new(quote_params)
        quote.save
        redirect_to quote.post
      end
    
      private
    
      def quote_params
        params.require(:quote).permit(:content, :post_id, :user_id, user_attributes:[:username])
      end
    end

end
