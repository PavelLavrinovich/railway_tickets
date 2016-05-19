class CreateCarriages < ActiveRecord::Migration
  def change
    create_table :carriages do |t|
      t.string :carriage_type
      t.integer :high_places
      t.integer :low_places
      t.integer :train_id

      t.timestamps null: false
    end
  end
end
