class GamesController < ApplicationController
    before_action :require_login, only: :create
    
    def index
        #if nested
        if params[:user_id]
            @games = User.find_by(id: params[:user_id]).games
            check_query(@games)
        else
            redirect_to board_games_path, notice: "Something went wrong!"
        end
    
    end

    def create 
        Game.create(user_id: params[:game][:user_id], board_game_id: params[:game][:board_game_id])
        
        redirect_to user_path(current_user)
    end

    private

    def check_query(games_to_check)
        
        if params[:game] && params[:game][:query]
            #TODO: CASE SENSITIVE
            @games = games_to_check.select { |game| game.board_game.name == params[:game][:query] }
    
            if @games == []
                user = User.find_by(id: params[:user_id])
                if user
                    @games = user.games 
                    redirect_to user_games_path(user), notice: "Couldn't find any games with that name"
                else 
                    redirect_to board_games_path, notice: "Couldn't find the user"
                end
            end 
            return @games
        else 
            return nil
        end
    end
end
