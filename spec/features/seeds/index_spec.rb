require 'rails_helper'

RSpec.describe 'Seeds Index Page' do
  before :each do
    @company = Company.create!(name: "Johnny's Seeds", accepting_orders: true, years_active: 10)
    @seed = @company.seeds.create!(name: "Tomato", available: true, quantity: 50)

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
  end
end
