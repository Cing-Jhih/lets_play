class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :receiever_id
      t.integer :message_id
      t.timestamps
    end
  end
end
