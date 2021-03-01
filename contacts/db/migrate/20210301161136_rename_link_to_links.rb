class RenameLinkToLinks < ActiveRecord::Migration[6.1]
  def change
    rename_table :link, :links
  end
end
