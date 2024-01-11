class CreateUnreadNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :unread_notifications do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :message, null: false, foreign_key: true

      t.timestamps
    end
  end
end
