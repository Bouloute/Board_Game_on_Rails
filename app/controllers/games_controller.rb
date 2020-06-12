class GamesController < ApplicationController
    before_action :require_login, only: :create
    
    def index
        #if nested
        if params[:user_id]
            @games = User.find_by(id: params[:user_id]).games
            @games = check_query(@games)
        else
            redirect_to board_games_path, notice: "Something went wrong!"
        end
    
    end

    def create
        Game.create(game_params)
        
        redirect_to user_games_path(current_user)
    end

    private
 
    def game_params
        params.require(:game).permit(
        :user_id,
        :board_game_id,
        :comment
        )
    end

    def check_query(games_to_check)
        
        if params[:game] && params[:game][:query]
            #TODO: CASE SENSITIVE
            games = games_to_check.select { |game| game.board_game.name == params[:game][:query] }
    
            #if found nothing
            if games == []
                user = User.find_by(id: params[:user_id])
                if user
                    games = user.games 
                    redirect_to user_games_path(user), notice: "Couldn't find any games with that name"
                else 
                    redirect_to board_games_path, notice: "Couldn't find the user"
                end
            end 
            return games
        else 
            return games_to_check
        end
    end
end
