require 'rails_helper'

RSpec.describe 'company show page' do
  describe 'when I visit /companies/:id' do
    it 'displays the company with id and its attributes' do
      company = Company.create!(name: "Johnny's Seeds", accepting_orders: true, years_active: 10)
      company_2 = Company.create!(name: "Turing Seeds", accepting_orders: false, years_active: 12)

      visit "/companies/#{company.id}"

      expect(page).to have_content(company.name)
      expect(page).to have_content(company.accepting_orders)
      expect(page).to have_content(company.years_active)

      expect(page).to_not have_content(company_2.name)
    end

    it 'displays the quantity of instructors in the Dojo' do
      company = Company.create!(name: "Johnny's Seeds", accepting_orders: true, years_active: 10)
      seed = company.seeds.create!(name: "Jessica", available: true, quantity: 3)
      seed_2 = company.seeds.create!(name: "Jimmy", available: false, quantity: 55)

      visit "/companies/#{company.id}"

      expect(page).to have_content(company.seeds.count)
    end
  end
end




# User Story 2, Parent Show (x2)
#
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table
