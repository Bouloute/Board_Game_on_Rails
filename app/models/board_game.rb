class BoardGame < ApplicationRecord 
    #validations
    validates :name, presence: true, uniqueness: true
    validates :time_duration, presence: true, numericality: { greater_than: 1 }
    validates :difficulty, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 5 }

    #relations
    has_many :games
    has_many :users, through: :games

    def self.find_by_name(name)
        self.where("name == ?", name)
    end
end