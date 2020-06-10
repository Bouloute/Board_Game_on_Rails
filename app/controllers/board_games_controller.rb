class BoardGamesController < ApplicationController
    before_action :require_login, only: [:new, :create]

    def index 
        if params[:query]
            #CASE SENSITIVE
            @board_games = BoardGame.where("name == ?", params[:query])
            
            if @board_games == []
                @board_games = BoardGame.all 
                @board_games.errors.add(:name, "Couldn't find any games with that name")
            end 
        else
            @board_games = BoardGame.all 
        end
        
    end

    def show 
        @board_game = BoardGame.find_by(id: params[:id])
        @game = Game.new(user: current_user, board_game: @board_game)
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
