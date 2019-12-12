class WelcomeController < ApplicationController

    def home
        if user_signed_in?
            redirect_to '/app'
        end

    end


    def contact
      
    end

end
