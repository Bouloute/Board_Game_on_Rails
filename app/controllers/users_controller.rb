class UsersController < ApplicationController

    def index 
        @users = User.all
    end

    def new 
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to board_games_path
        else 
            render :new
        end
    end

    private
 
    def user_params
        params.require(:user).permit(
        :name,
        :password,
        :email
        )
    end
end
