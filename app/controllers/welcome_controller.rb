class WelcomeController < ApplicationController
    # The user is presented with the main homepage if the user is not currently
    # logged in. However if the user is currently loged in, the user is redirected
    # with a view of the applcation and its associated data.
    def home
        if user_signed_in?
            redirect_to '/app'
        end
    end

    # Allows the user to be request and send a message to the applciation developers
    # regarding the applciation, and any other relevant queires. 
    def request_contact
      name = params[:name]
      email = params[:email]
      telephone = params[:telephone]
      message = params[:message]
      if email.blank?
        flash[:alert] = I18n.t('contact.no_email')
      else
        ContactMailer.contact_email(email,name,telephone,message).deliver_now
        flash[:notice] = I18n.t('contact.yes_email')
      end
      redirect_to root_path
    end


end
