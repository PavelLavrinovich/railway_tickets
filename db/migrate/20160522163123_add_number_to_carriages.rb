class AddNumberToCarriages < ActiveRecord::Migration
  def change
    add_column :carriages, :number, :integer
  end
end
