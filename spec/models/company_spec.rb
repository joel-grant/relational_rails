require 'rails_helper'

RSpec.describe Company do
  it { should have_many :seeds }

  it 'returns the name of each company in order of most recently created' do
    company = Company.create!(name: "Johnny's Seeds", accepting_orders: true, years_active: 10)
    company_2 = Company.create!(name: "Turing Seeds", accepting_orders: false, years_active: 12)
    company_3 = Company.create!(name: "Seeds of Fury", accepting_orders: true, years_active: 1)

    companies = [company, company_2, company_3]
    expect(Company.recently_created).to eq(companies)
  end
end
