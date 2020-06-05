class BoardGamesController < ApplicationController
    def index 
        @board_games = BoardGame.all 
    end

    def show 
        @board_game = BoardGame.find_by(id: params[:id])
    end

    def new 
        @board_game = BoardGame.new 
    end

    def create 
        @board_game = BoardGame.create(board_game_params)
        if @board_game.valid?
            redirect_to board_games_path
        else 
            render :new
        end
    end

    private
 
    def board_game_params
        params.require(:board_game).permit(
        :name,
        :time_duration,
        :difficulty,
        :rules
        )
    end
end
