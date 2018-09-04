class ChangeOldInAges < ActiveRecord::Migration[5.1]
  def change
    change_column :ages, :old, :float
  end
end
