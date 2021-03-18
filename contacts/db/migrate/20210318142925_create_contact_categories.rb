class CreateContactCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_categories do |t|
      t.integer :contact_id
      t.integer :category_id
      t.timestamps
    end
  end
end
