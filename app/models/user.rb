class User < ApplicationRecord 
    #bcrypt
    has_secure_password

    #validations
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true #inclusion @  

    #relations
    has_many :games
    has_many :board_games, through: :games
end