class AddDescriptionToContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :description, :string
  end
end
