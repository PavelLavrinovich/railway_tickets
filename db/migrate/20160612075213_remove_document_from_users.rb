class RemoveDocumentFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :document, :string
  end
end
