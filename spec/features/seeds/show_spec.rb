require 'rails_helper'

RSpec.describe 'seed show page' do
  describe 'when i visit /seeds/:id' do
    it 'displays the seed and attributes' do
      company = Company.create!(name: "Johnny's Seeds", accepting_orders: true, years_active: 10)
      company_2 = Company.create!(name: "Turing Seeds", accepting_orders: false, years_active: 6)
      seed = company.seeds.create!(name: "Jessica", available: true, quantity: 3)
      seed_2 = company_2.seeds.create!(name: "Jimmy", available: false, quantity: 55)

      visit "/seeds/#{seed.id}"

      expect(page).to have_content(seed.name)
      expect(page).to have_content(seed.available)
      expect(page).to have_content(seed.quantity)

      expect(page).to_not have_content(seed_2.name)
    end
  end
end
