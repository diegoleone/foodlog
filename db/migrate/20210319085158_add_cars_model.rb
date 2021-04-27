class AddCarsModel < ActiveRecord::Migration[6.0]
  def up
    create_table :cars do |t|
      t.string :name
      t.float :size
      t.float :weight
      t.integer :power
      t.integer :year
      t.integer :status

      t.timestamps
    end
  end

  def down
    drop_table :cars
  end
end
