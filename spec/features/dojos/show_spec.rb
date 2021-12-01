require 'rails_helper'

RSpec.describe 'dojo show page' do
  describe 'when I visit /dojos/:id' do
    it 'displays the dojo with id and its attributes' do
      dojo = Dojo.create!(name: "Blue Fist", open: true, rating: 2)
      dojo_2 = Dojo.create!(name: "Fist of Truth", open: false, rating: 4)
      visit "/dojos/#{dojo.id}"

      expect(page).to have_content(dojo.name)
      expect(page).to have_content(dojo.open)
      expect(page).to have_content(dojo.rating)

      expect(page).to_not have_content(dojo_2.name)
      expect(page).to_not have_content(dojo_2.open)
      expect(page).to_not have_content(dojo_2.rating)
    end
  end
end




# User Story 2, Parent Show (x2)
#
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table