class AddNameValidationOnChannel < ActiveRecord::Migration[7.1]
  def change
    change_column :channels, :name, :string, null: false
  end
end
