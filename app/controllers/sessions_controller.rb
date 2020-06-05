class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        @user = login_validation(@user)
        
        if @user.id
            return render :new unless @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to users_path #board_games_path
        else
            render :new 
        end
    
    end
    
    def destroy
        session.delete :user_id
        redirect_to "/login"
    end

    def login_validation(user)
        
        if !user
            user = User.new
            user.errors.add(:name, "not found")
        else 
            if user.authenticate(params[:user][:password])
                user.errors.add(:password, "Incorrect password")
            end 
        end
        user
    end
end