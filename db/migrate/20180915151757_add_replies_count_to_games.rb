class AddRepliesCountToGames < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :favorites_count
    add_column :games, :favorites_count, :integer, default: 0
    add_column :games, :replies_count, :integer, default: 0
  end
end
