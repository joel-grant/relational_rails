require 'rails_helper'

RSpec.describe 'dojo index page' do
  describe 'when I navigate to /dojos' do
    it 'returns the name of each dojo' do
      dojo = Dojo.create!(name: "Blue Fist", open: true, rating: 2)
      visit "/dojos"

      expect(page).to have_content(dojo.name)
    end
  end
end

# User Story 1, Parent Index (x2)
#
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
