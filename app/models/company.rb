class Company < ApplicationRecord
  has_many :seeds

  def self.recently_created
    order(:created_at)
  end

  def self.partial_match(keyword)
    where("Name  LIKE ?", "%#{keyword}%")
  end
end
