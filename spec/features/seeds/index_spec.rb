require 'rails_helper'

RSpec.describe 'Seeds Index Page' do 
  describe 'when i visit /seeds' do 
    it  'shows the name of each seed + attributes' do 
      seed = Seed.create!(name: "Tomato", available: true, quantity: 50)
      visit "/seeds"

      expect(page).to have_content(seed.name)
      expect(page).to have_content(seed.available)
      expect(page).to have_content(seed.quantity)
    end 
  end 
end 