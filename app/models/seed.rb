class Seed < ApplicationRecord
  belongs_to :company

  def self.return_true
    where(available: true)
  end

  def self.alphabetize(company_id)
    where(company_id: company_id).order(:name)
  end

  def self.filter_threshold(threshold)
    where('quantity > ?', threshold)
  end

  def self.partial_match(keyword)
    where("Name  LIKE ?", "%#{keyword}%")
  end
end
