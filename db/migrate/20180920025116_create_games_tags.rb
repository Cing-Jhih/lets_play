class CreateGamesTags < ActiveRecord::Migration[5.1]
  def change
    create_table :games_tags, :id => false do |t|
      t.references :game, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
    end
  end
end
