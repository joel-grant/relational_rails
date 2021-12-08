require 'rails_helper'

RSpec.describe 'Seeds Index Page' do
  before :each do
    @company = Company.create!(name: "Johnny's Seeds", accepting_orders: true, years_active: 10)
    @seed = @company.seeds.create!(name: "Tomato", available: true, quantity: 50)
    @seed_2 = @company.seeds.create!(name: "Jalapeno", available: true, quantity: 50)
    @seed_3 = @company.seeds.create!(name: "Onion", available: false, quantity: 50)


    visit "/seeds"
  end

  describe 'when i visit /seeds' do
    it  'shows the name of each seed + attributes' do
      expect(page).to have_content(@seed.name)
      expect(page).to have_content(@seed.available)
      expect(page).to have_content(@seed.quantity)
    end

    it 'has a link that goes to the companies index' do
      click_link "Companies Index"

      expect(current_path).to eq("/companies")
    end

    it 'shows only the instructors on payroll' do
      expect(page).to have_content(@seed.name)
      expect(page).to have_content(@seed_2.name)
      expect(page).to_not have_content(@seed_3.name)
    end

    it 'has a text box to filter results by keyword' do
      expect(page).to have_content(@seed.name)
      expect(page).to have_content(@seed_2.name)

      fill_in(:keyword, with: "Jala")
      click_button "Search"

      expect(current_path).to eq("/seeds")
      expect(page).to have_content(@seed_2.name)
      expect(page).to_not have_content(@seed.name)
      expect(page).to_not have_content(@seed_3.name)
    end
  end
end
