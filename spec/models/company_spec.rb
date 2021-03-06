require 'rails_helper'

RSpec.describe Company do
  before :each do
    @company = Company.create!(name: "Johnny's Seeds", accepting_orders: true, years_active: 10)
    @company_2 = Company.create!(name: "Turing Seeds", accepting_orders: false, years_active: 12)
    @company_3 = Company.create!(name: "Seeds of Fury", accepting_orders: true, years_active: 1)
  end

  it { should have_many :seeds }

  it 'returns the name of each company in order of most recently created' do
    companies = [@company_3, @company_2, @company]
    expect(Company.recently_created).to eq(companies)
  end

  it 'returns records that are a partial match' do
    expect(Company.partial_match("Joh")).to eq([@company])
  end
end
