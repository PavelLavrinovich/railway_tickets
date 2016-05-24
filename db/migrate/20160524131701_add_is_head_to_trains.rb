class AddIsHeadToTrains < ActiveRecord::Migration
  def change
    add_column :trains, :is_head, :boolean, default: true
  end
end
