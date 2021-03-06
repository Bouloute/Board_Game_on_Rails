class BoardGamesController < ApplicationController
    before_action :require_login, only: [:new, :create]
    
    def index
        @board_games = check_query(BoardGame.all)
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

    def check_query(board_games_to_check)
        
        if params[:board_game] && params[:board_game][:query]
            #TODO: CASE SENSITIVE
            board_games = board_games_to_check.name_is(params[:board_game][:query])
    
            #if found nothing
            if board_games == []
                user = User.find_by(id: params[:user_id])
                if user
                    board_games = user.board_games 
                    redirect_to user_board_games_path(user), notice: "Couldn't find any games with that name"
                else 
                    redirect_to board_games_path, notice: "Couldn't find the user"
                end
            end 
            return board_games
        else 
            return board_games_to_check
        end
    end
end
