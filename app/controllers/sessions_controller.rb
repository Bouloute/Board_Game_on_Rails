class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        #if used omniauth
        if auth
            @user = User.find_or_create_by(email: auth['info']['email']) do |u|
                u.name = auth['info']['name']
                u.password = SecureRandom.hex
            end
        else

            @user = User.find_by(name: params[:user][:name])
            @user = login_validation(@user)
            
            if @user.id
                return render :new unless @user.authenticate(params[:user][:password])
            else 
                return render :new
            end
        end
        
        #if @user.valid? 
        #    render :new 
        #end
        session[:user_id] = @user.id
        redirect_to board_games_path
    end
    
    def destroy
        session.delete :user_id
        redirect_to "/login"
    end

    private

    def login_validation(user)
        
        if !user
            user = User.new
            user.errors.add(:name, "not found")
        else 
            if !user.authenticate(params[:user][:password])
                user.errors.add(:password, "is incorrect")
            end 
        end
        user
    end

    def auth
        request.env['omniauth.auth']
    end

end