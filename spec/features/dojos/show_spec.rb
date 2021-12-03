require 'rails_helper'

RSpec.describe 'dojo show page' do
  before :each do
    @dojo = Dojo.create!(name: "Blue Fist", open: true, rating: 2)
    @dojo_2 = Dojo.create!(name: "Purple Fist", open: true, rating: 2)
    @instructor = @dojo.instructors.create!(name: "Jessica", payroll: true, experience: 3)
    @instructor_2 = @dojo.instructors.create!(name: "Jimmy", payroll: false, experience: 55)

    visit "/dojos/#{@dojo.id}"
  end

  describe 'when I visit /dojos/:id' do
    it 'displays the dojo with id and its attributes' do
      expect(page).to have_content(@dojo.name)
      expect(page).to have_content(@dojo.open)
      expect(page).to have_content(@dojo.rating)

      expect(page).to_not have_content(@dojo_2.name)
    end

    it 'displays the quantity of instructors in the Dojo' do
      expect(page).to have_content(@dojo.instructors.count)
    end

    it 'has a link that goes to the instructors index' do
      click_link "Instructors Index"

      expect(current_path).to eq("/instructors")
    end

    it 'has a link that goes to the dojos index' do
      click_link "Dojos Index"

      expect(current_path).to eq("/dojos")
    end

    it 'has a link that goes to the dojo instructors index' do
      click_link "Dojo Instructors Index"

      expect(current_path).to eq("/dojos/#{@dojo.id}/instructors")
    end
  end
end
