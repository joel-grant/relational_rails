require 'rails_helper' 

RSpec.describe 'Seed Edit' do 
  before :each do
      @company = Company.create!(name: "Johnny's Seeds", accepting_orders: true, years_active: 10)
      @company_2 = Company.create!(name: "Turing Seeds", accepting_orders: false, years_active: 6)
      @seed = @company.seeds.create!(name: "Onion", available: true, quantity: 3)
      @seed_2 = @company_2.seeds.create!(name: "Jimmy", available: false, quantity: 55)

      visit "/seeds/#{@seed.id}"
  end

  describe 'When I visit the Seed Show Page' do 
    it 'Links to the Edit Page' do 
      click_link "Update #{@seed.name}"

      expect(current_path).to eq("/seeds/#{@seed.id}/edit")
    end 
  end 

  describe 'It has a form to Edit Seed' do 
    it 'can edit and show seed attributes' do 
      visit "/seeds/#{@seed.id}/edit"

      fill_in(:name, with: "Onion")
      fill_in(:available, with: true)
      fill_in(:quantity, with: 100)

      click_button "Update #{@seed.name}"

      expect(current_path).to eq("/seeds/#{@seed.id}")
      expect(page).to have_content("Onion")
    end 
  end
end 