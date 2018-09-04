class ChangeKidbirthInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :kid_birth, :date
  end
end
