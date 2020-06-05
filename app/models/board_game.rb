class BoardGame < ApplicationRecord 
    #validations
    validates :name, presence: true
    validates :time_duration, presence: true, numericality: { greater_than: 1 }
    validates :dificulty, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 5 }
    validates :category, presence: true#, inclusion: {in: CATEGORY}

    #relations
    has_many :games
    has_many :users, through: :games

  
    def category 
        ["Strategy",
        "Puzzle"]
    end
end