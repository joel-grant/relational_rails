class AddCompanyToSeeds < ActiveRecord::Migration[5.2]
  def change
    add_reference :seeds, :company, foreign_key: true
  end
end
