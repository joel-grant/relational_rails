class CreateDojo < ActiveRecord::Migration[5.2]
  def change
    create_table :dojos do |t|
      t.string :name
      t.boolean :open
      t.integer :rating

      t.timestamps
    end
  end
end
