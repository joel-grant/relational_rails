require 'rails_helper'

RSpec.describe 'company index page' do
  describe 'when I visit /companies' do
    it 'shows the name of each parent record' do
      company = Company.create!(name: "Johnny's Seeds", accepting_orders: true, years_active: 10)
      visit "/companies"

      expect(page).to have_content(company.name)
    end
  end
end



# User Story 1, Parent Index (x2)
#
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
