class CreateCarriages < ActiveRecord::Migration
  def change
    create_table :carriages do |t|
      t.string :carriage_type
      t.integer :high_places
      t.integer :low_places
      t.belongs_to :train

      t.timestamps null: false
    end
  end
end
