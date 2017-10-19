class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.references :part, foreign_key: true
      t.references :warehouse, foreign_key: true

      t.timestamps
    end
  end
end
