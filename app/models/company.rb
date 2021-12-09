class Company < ApplicationRecord
  has_many :seeds

  def self.recently_created
    order(created_at: :desc)
  end

  def self.partial_match(keyword)
    where("Name  ILIKE ?", "%#{keyword}%")
  end
end
