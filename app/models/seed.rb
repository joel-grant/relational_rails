class Seed < ApplicationRecord
  belongs_to :company

  def self.return_true
    where(available: true)
  end
end
