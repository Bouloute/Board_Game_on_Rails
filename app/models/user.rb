class User < ApplicationRecord 
    #bcrypt
    has_secure_password

    #validations
    validates :name, presence: true

    #relations
    belongs_to :game
    has_many :board_games, through: :game
end