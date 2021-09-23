class SessionsController < ApplicationController
    def destroy
        session.delete :user_id
        redirect_to root_path
        flash[:notice] = "Successfully logged out"
    end
end
