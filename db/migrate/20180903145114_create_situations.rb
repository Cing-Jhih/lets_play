class CreateSituations < ActiveRecord::Migration[5.1]
  def change
    create_table :situations do |t|
      t.text :condition
      t.timestamps
    end
  end
end
