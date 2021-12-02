require 'rails_helper'

RSpec.describe 'dojo index page' do
  describe 'when I navigate to /dojos' do
    it 'returns the name of each dojo' do
      dojo = Dojo.create!(name: "Blue Fist", open: true, rating: 2)
      visit "/dojos"

      expect(page).to have_content(dojo.name)
    end

    it 'returns the name of each dojo in order of most recently created' do
      dojo = Dojo.create!(name: "Blue Fist", open: true, rating: 2, created_at: Time.now + 1)
      dojo_2 = Dojo.create!(name: "Fist of Truth", open: false, rating: 4, created_at: Time.now + 2)
      dojo_3 = Dojo.create!(name: "Fists of Fury", open: true, rating: 1, created_at: Time.now + 3)

      visit "/dojos"

      expect(dojo.name).to appear_before(dojo_2.name)
      expect(dojo_2.name).to appear_before(dojo_3.name)
    end
  end
end

# User Story 1, Parent Index (x2)
#
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
