class AddUserIdToContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :user_id, :int
  end
end
