class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        # create new user "signup form"
        @user = User.new(user_params)
        if @user.save
            redirect_to root_path, notice: "Successfully created an account"
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
