module BoardGamesHelper
    
    def display_user_name_if_not_current
        if current_user && params[:user_id] 
            if !(params[:user_id] == current_user.id.to_s)
                "Games "+ User.find_by(id: params[:user_id]).name + " has played :"
            else
                "Games I have played"
            end
        end
    end

    def url_for_form_for_search_bar
        if params[:user_id]
            user_board_games_path(params[:user_id])
        else 
            board_games_path
        end
    end
end
