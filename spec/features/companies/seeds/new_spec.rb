require 'rails_helper'

RSpec.describe 'Company Seeds Creation' do 
  before :each do
    @company = Company.create!(name: "Johnny's Seeds", accepting_orders: true, years_active: 10)
    @company_2 = Company.create!(name: "Turing Seeds", accepting_orders: false, years_active: 6)

    @seed = @company.seeds.create!(name: "Jessica", available: true, quantity: 3)
    @seed_2 = @company_2.seeds.create!(name: "Jimmy", available: false, quantity: 55)

    visit "/companies/#{@company.id}/seeds"
  end

  describe 'when i visit the Seed Index page' do 
    it 'links from the index page to the new page' do 
      click_link("Create Seed")

      expect(current_path).to eq("/companies/#{@company.id}/seeds/new")
    end 

    it 'has a form to create a new seed' do 
      visit "/companies/#{@company.id}/seeds/new"

      fill_in(:name, with: "Pepper")
      fill_in(:available, with: true)
      fill_in(:quantity, with: 50)
      click_button "Create Seed"

      expect(current_path).to eq("/companies/#{@company.id}/seeds")
      expect(page).to have_content("Pepper")
    end 
  end 
end 