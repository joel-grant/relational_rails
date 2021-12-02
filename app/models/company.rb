class Company < ApplicationRecord
  has_many :seeds

  def self.recently_created
    order(:created_at)
  end
end
