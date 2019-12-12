class WelcomeController < ApplicationController

    def home
        if user_signed_in?
            redirect_to '/app'
        end

    end


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
