class AddColumnToAges < ActiveRecord::Migration[5.1]
  def change
    add_column :ages, :name, :string
  end
end
