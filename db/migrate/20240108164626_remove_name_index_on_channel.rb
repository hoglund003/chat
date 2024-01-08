class RemoveNameIndexOnChannel < ActiveRecord::Migration[7.1]
  def change
    remove_index :channels, :name
  end
end
