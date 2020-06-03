class BoardGame < ApplicationRecord 
    #validations
    validates :name, presence: true
    validates :time_duration, presence: true, length: { min: 1 }
    validates :dificulty, presence: true, length: { min: 1, max: 5}
    validates :category, presence: true, inclusion: {in: CATEGORY}

    #relations
    has_many :games
    has_many :users, through: :games
end