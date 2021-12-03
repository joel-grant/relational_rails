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

    it 'has a link that goes to the seeds index' do 
      click_link "Instructors Index"

      expect(current_path).to eq("/instructors")
    end 
  end
end