class Instructor < ApplicationRecord
  belongs_to :dojo

  def self.return_true
    where(payroll: true)
  end

  def self.alphabetize(dojo_id)
    where(dojo_id: dojo_id).order(:name)
  end
end
