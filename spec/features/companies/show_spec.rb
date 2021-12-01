require 'rails_helper'

RSpec.describe 'company show page' do
  describe 'when I visit /companies/:id' do
    it 'displays the company with id and its attributes' do
      company = Company.create!(name: "Johnny's Seeds", accepting_orders: true, years_active: 10)
      company_2 = Company.create!(name: "Turing Seeds", accepting_orders: false, years_active: 6)
      visit "/companies/#{company.id}"
      
      expect(page).to have_content(company.name)
      expect(page).to have_content(company.accepting_orders)
      expect(page).to have_content(company.years_active)

      expect(page).to_not have_content(company_2.name)
      expect(page).to_not have_content(company_2.accepting_orders)
      expect(page).to_not have_content(company_2.years_active)
    end
  end
end




# User Story 2, Parent Show (x2)
#
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table
