class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :frirst_name
      t.string :last_name
      t.string :media

      t.timestamps
    end
  end
end
