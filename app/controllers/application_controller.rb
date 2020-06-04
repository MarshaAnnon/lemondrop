class ApplicationController < ActionController::Base

    def home
        if current_user
            @reading = current_user.user_books.reading
        end
    end
end
