class Game < ApplicationRecord 
    #relations
    belongs_to :user
    belongs_to :board_game
end