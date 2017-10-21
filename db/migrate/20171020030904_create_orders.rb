class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :warehouse, foreign_key: true
      t.boolean :submitted, default: false
      t.boolean :fulfilled, default: false

      t.timestamps
    end
  end
end
