module ApplicationHelper
    
    def display_user_or_home_page
        #binding.pry 
        if current_user
            link_to current_user.name, user_board_games_path(current_user)
        else 
            link_to "Home", "/"
        end
    end

    def display_log_in_out
        if current_user
            link_to "Logout", "/logout", method:'delete' 
        else 
            link_to "Login", "/login"
        end
    end
end
