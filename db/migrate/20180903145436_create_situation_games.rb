class CreateSituationGames < ActiveRecord::Migration[5.1]
  def change
    create_table :situation_games do |t|
      t.integer :game_id
      t.integer :situation_id
      t.timestamps
    end
  end
end
