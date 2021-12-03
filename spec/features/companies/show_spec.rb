require 'rails_helper'

RSpec.describe 'company show page' do
  before :each do
    @company = Company.create!(name: "Johnny's Seeds", accepting_orders: true, years_active: 10)
    @company_2 = Company.create!(name: "Turing Seeds", accepting_orders: false, years_active: 12)

    visit "/companies/#{@company.id}"
  end
  describe 'when I visit /companies/:id' do
    it 'displays the company with id and its attributes' do
      expect(page).to have_content(@company.name)
      expect(page).to have_content(@company.accepting_orders)
      expect(page).to have_content(@company.years_active)

      expect(page).to_not have_content(@company_2.name)
    end

    it 'displays the quantity of instructors in the Dojo' do
      expect(page).to have_content(@company.seeds.count)
    end

    it 'has a link that goes to the seeds index' do
      click_link "Seeds Index"

      expect(current_path).to eq("/seeds")
    end

    it 'has a link that goes to the companies index' do
      click_link "Companies Index"

      expect(current_path).to eq("/companies")
    end

    it 'has a link that goes to the company seeds index' do
      click_link "Company Seeds Index"

      expect(current_path).to eq("/companies/#{@company.id}/seeds")
    end
  end
end




# User Story 2, Parent Show (x2)
#
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table
