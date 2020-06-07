class GamesController < ApplicationController

    def create 
        Game.create(user: params[:user_id], board_game: params[:board_game_id])
        redirect_to user_path(current_user)
    end

end
