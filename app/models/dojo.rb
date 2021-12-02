class Dojo < ApplicationRecord
  has_many :instructors

  def self.recently_created
    order(:created_at)
  end
end
