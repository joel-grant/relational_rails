require 'rails_helper'

RSpec.describe 'instructor show page' do
  before :each do 
    @dojo = Dojo.create!(name: "Blue Fist", open: true, rating: 2)
    @dojo_2 = Dojo.create!(name: "Fist of Truth", open: false, rating: 4)

    @instructor = @dojo.instructors.create!(name: "Jessica", payroll: true, experience: 3)
    @instructor_2 = @dojo_2.instructors.create!(name: "Jimmy", payroll: false, experience: 55)

    visit "/instructors/#{@instructor.id}"
  end 

  describe 'when i visit /instructors/:id' do
    it 'displays the instructor and attributes' do

      expect(page).to have_content(@instructor.name)
      expect(page).to have_content(@instructor.payroll)
      expect(page).to have_content(@instructor.experience)

      expect(page).to_not have_content(@instructor_2.name)
      expect(page).to_not have_content(@instructor_2.payroll)
      expect(page).to_not have_content(@instructor_2.experience)
    end

    it 'has a link that goes to the seeds index' do 
      click_link "Instructors Index"

      expect(current_path).to eq("/instructors")
    end   
  end
end
