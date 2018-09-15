class AddCountColummToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :favorites_count, :integer, default: 0
    add_column :users, :games_count, :integer, default: 0
    add_column :users, :replies_count, :integer, default: 0
  end
end
