require 'rails_helper'

RSpec.describe 'dojo index page' do
  before :each do
    @dojo = Dojo.create!(name: "Blue Fist", open: true, rating: 2)
    @dojo_2 = Dojo.create!(name: "Fist of Truth", open: false, rating: 4)
    @dojo_3 = Dojo.create!(name: "Fists of Fury", open: true, rating: 1)

    visit "/dojos"
  end
  describe 'when I navigate to /dojos' do
    it 'returns the name of each dojo' do
      expect(page).to have_content(@dojo.name)
    end

    it 'returns the name of each dojo in order of most recently created' do
      expect(@dojo.name).to appear_before(@dojo_2.name)
      expect(@dojo_2.name).to appear_before(@dojo_3.name)
    end

    it 'has a link that goes to the instructors index' do 
      click_link "Instructors Index"

      expect(current_path).to eq("/instructors")
    end

    it 'next to every Dojo, there is a link to edit their info' do 

      click_link "Edit #{@dojo.name}"
      expect(current_path).to eq("/dojos/#{@dojo.id}/edit")

      visit "/dojos"

      click_link "Edit #{@dojo_2.name}"
      expect(current_path).to eq("/dojos/#{@dojo_2.id}/edit")

      visit "/dojos"

      click_link "Edit #{@dojo_3.name}"
      expect(current_path).to eq("/dojos/#{@dojo_3.id}/edit")
    end 

    it 'takes user to form to update dojo info' do
      visit "/dojos/#{@dojo.id}/edit"

      fill_in(:name, with: "Miyagi World")
      fill_in(:open, with: true)
      fill_in(:rating, with: 5)

      click_button "Update Dojo"
      
      expect(current_path).to eq("/dojos/#{@dojo.id}")
      expect(page).to have_content("Miyagi World")
    end
  end
end
