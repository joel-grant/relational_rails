class AddDojoToInstructors < ActiveRecord::Migration[5.2]
  def change
    add_reference :instructors, :dojo, foreign_key: true
  end
end
