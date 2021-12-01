require 'rails_helper' 

RSpec.describe 'seed show page' do 
  describe 'when i visit /seeds/:id' do 
    it 'displays the seed and attributes' do 
      seed = Seed.create!(name: "Jessica", available: true, quantity: 3)
      seed_2 = Seed.create!(name: "Jimmy", available: false, quantity: 55)
      
      visit "/seeds/#{seed.id}"

      expect(page).to have_content(seed.name)
      expect(page).to have_content(seed.available)
      expect(page).to have_content(seed.quantity)

      expect(page).to_not have_content(seed_2.name)
      expect(page).to_not have_content(seed_2.available)
      expect(page).to_not have_content(seed_2.quantity)
    end 
  end 
end 