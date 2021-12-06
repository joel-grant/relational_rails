require 'rails_helper'

RSpec.describe Seed do
  before :each do
    @company = Company.create!(name: "Johnny's Seeds", accepting_orders: true, years_active: 10)
    @seed = @company.seeds.create!(name: "Tomato", available: true, quantity: 50)
    @seed_2 = @company.seeds.create!(name: "Jalapeno", available: true, quantity: 50)
    @seed_3 = @company.seeds.create!(name: "Onion", available: false, quantity: 50)
  end
  it { should belong_to :company }

  it 'only returns the seeds with a true value as its boolean' do
    # company = Company.create!(name: "Johnny's Seeds", accepting_orders: true, years_active: 10)
    # seed = company.seeds.create!(name: "Tomato", available: true, quantity: 50)
    # seed_2 = company.seeds.create!(name: "Jalapeno", available: true, quantity: 50)
    # seed_3 = company.seeds.create!(name: "Onion", available: false, quantity: 50)

    seeds = [@seed, @seed_2]
    expect(Seed.return_true).to eq(seeds)
  end

  it 'can alphabetize the seeds by name' do
    seeds = [@seed_2, @seed_3, @seed]
    expect(Seed.alphabetize(@company.id)).to eq(seeds)
  end
end
