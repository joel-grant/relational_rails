class CreateInstructor < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :name
      t.boolean :payroll
      t.integer :experience

      t.timestamps
    end
  end
end
