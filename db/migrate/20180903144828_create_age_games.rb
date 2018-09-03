class CreateAgeGames < ActiveRecord::Migration[5.1]
  def change
    create_table :age_games do |t|
      t.integer "game_id"
      t.integer "age_id"
      t.timestamps
    end
  end
end
