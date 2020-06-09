class User < ApplicationRecord 
    #bcrypt
    has_secure_password

    #validations
    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true #inclusion @  
    validates :password, presence: true

    #relations
    has_many :games
    has_many :board_games, through: :games
end