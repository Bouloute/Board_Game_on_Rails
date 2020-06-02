class BoardGame < ApplicationRecord 
    #validations
    validates :name, presence: true
    validates :time_duration, presence: true, length: { min: 1 }
    validates :dificulty, presence: true, length: { min: 1, max: 5}
    validates :category, presence: true, inclusion: {in: CATEGORY}

    #relations
    belongs_to :game
    has_many :users, through: :game
end