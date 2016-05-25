class CreateCarriages < ActiveRecord::Migration
  def change
    create_table :carriages do |t|
      t.string :type
      t.integer :high_places
      t.integer :low_places
      t.integer :side_high_places
      t.integer :side_low_places
      t.integer :sit_places

      t.belongs_to :train

      t.timestamps null: false
    end
  end
end
