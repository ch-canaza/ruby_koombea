class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.references :contact, null: false, foreign_key: true
      t.string :first_name
      t.string :media

      t.timestamps
    end
  end
end
