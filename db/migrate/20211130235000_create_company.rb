class CreateCompany < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.boolean :accepting_orders
      t.integer :years_active

      t.timestamps
    end
  end
end
