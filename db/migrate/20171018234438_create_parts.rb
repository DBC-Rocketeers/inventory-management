class CreateParts < ActiveRecord::Migration[5.1]
  def change
    create_table :parts do |t|
      t.string :name
      t.integer :number

      t.timestamps
    end
  end
end
