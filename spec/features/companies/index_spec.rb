require 'rails_helper'

RSpec.describe 'company index page' do
  before :each do 
    @company = Company.create!(name: "Johnny's Seeds", accepting_orders: true, years_active: 10)
    @company_2 = Company.create!(name: "Turing Seeds", accepting_orders: false, years_active: 12)
    @company_3 = Company.create!(name: "Seeds of Fury", accepting_orders: true, years_active: 1)

    visit "/companies"
  end 
  describe 'when I visit /companies' do
    it 'shows the name of each parent record' do
      expect(page).to have_content(@company.name)
    end

    it 'returns the name of each company in order of most recently created' do
      expect(@company.name).to appear_before(@company_2.name)
      expect(@company_2.name).to appear_before(@company_3.name)
    end

    it 'has a link that goes to the seeds index' do 
      click_link "Seeds Index"

      expect(current_path).to eq("/seeds")
    end 
  end
end



# User Story 1, Parent Index (x2)
#
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
