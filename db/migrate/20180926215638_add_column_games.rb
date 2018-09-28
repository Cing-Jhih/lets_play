class AddColumnGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :min_age, :integer, limit: 12
    add_column :games, :max_age, :integer, limit: 12
  end
end
