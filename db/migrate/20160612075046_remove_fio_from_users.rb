class RemoveFioFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :fio, :string
  end
end
