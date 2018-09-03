class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :title
      t.string :image
      t.text :tool
      t.text :step
      t.string :url
      t.integer :user_id
      t.timestamps
    end
  end
end
