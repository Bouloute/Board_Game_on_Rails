class CreateBoardGames < ActiveRecord::Migration[6.0]
  def change
    create_table :board_games do |t|
      t.string :name
      t.integer :time_duration
      t.integer :difficulty 
      t.string :rules
      t.string :category
    end
  end
end
