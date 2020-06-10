module BoardGamesHelper
    
    def display_user_name_if_not_current
        if current_user && params[:user_id] && !(params[:user_id] == current_user.id.to_s)
            User.find_by(id: params[:user_id]).name
        end
    end
end
