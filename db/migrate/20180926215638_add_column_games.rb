class AddColumnGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :min_age, :integer
    add_column :games, :max_age, :integer
  end
end
