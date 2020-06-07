class GamesController < ApplicationController

    def create 
        Game.create(user_id: params[:game][:user_id], board_game_id: params[:game][:board_game_id])
        
        redirect_to user_path(current_user)
    end

end
