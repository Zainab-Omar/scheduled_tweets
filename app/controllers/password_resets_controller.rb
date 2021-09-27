class PasswordResetsController < ApplicationController
    
    def new
    end

    def create 
        @user = User.find_by(email: params[:email])
        if @user.present?
            #send email
            PasswordMailer.with(user: @user).reset.deliver_now
            redirect_to root_path, notice: "Reset link sent to your email"
        else
            redirect_to root_path, notice: "Invalid email"
        end
    end

end
