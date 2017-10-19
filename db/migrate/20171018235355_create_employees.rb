class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.string :employee_id, null: false, unique: true
      t.string :password_digest
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
