class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.references :part, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :ordered_quantity
      t.integer :received_quantity, default: 0

      t.timestamps
    end
  end
end
