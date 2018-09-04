class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.text :content
      t.integer :game_id
      t.integer :user_id
      t.timestamps
    end
  end
end