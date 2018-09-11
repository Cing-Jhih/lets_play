class AddFavoritesCountToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :favorites_count, :integer
  end
end
