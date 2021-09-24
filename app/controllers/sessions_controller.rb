class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Successfully Signed in!"
        else
            flash[:alert] = "Invalid email or password"
            render :new
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
        flash[:notice] = "Successfully logged out"
    end
end
