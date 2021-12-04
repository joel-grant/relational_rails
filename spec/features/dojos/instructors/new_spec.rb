require 'rails_helper'

RSpec.describe 'Dojo Instructors Creation' do 
  before :each do
    @dojo = Dojo.create!(name: "Blue Fist", open: true, rating: 2)
    @dojo_2 = Dojo.create!(name: "Fist of Truth", open: false, rating: 4)

    @instructor = @dojo.instructors.create!(name: "Jessica", payroll: true, experience: 3)
    @instructor_2 = @dojo_2.instructors.create!(name: "Jimmy", payroll: false, experience: 55)

    visit "/dojos/#{@dojo.id}/instructors"
  end

  describe 'when i visit the Instructors Index page' do 
    it 'links from the index page to the new page' do 
      click_link("Create Instructor")

      expect(current_path).to eq("/dojos/#{@dojo.id}/instructors/new")
    end 

    it 'has a form to create a new seed' do 
      visit "/dojos/#{@dojo.id}/instructors/new"

      fill_in(:name, with: "Pepper")
      fill_in(:payroll, with: true)
      fill_in(:experience, with: 20)
      click_button "Create Instructor"

      expect(current_path).to eq("/dojos/#{@dojo.id}/instructors")
      expect(page).to have_content("Pepper")
    end 
  end 
end 