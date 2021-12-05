require 'rails_helper'

RSpec.describe 'Instructor Index Page' do
  before :each do
    @dojo = Dojo.create!(name: "Blue Fist", open: true, rating: 2)
    @instructor = @dojo.instructors.create!(name: "Jessica", payroll: true, experience: 3)
    @instructor_2 = @dojo.instructors.create!(name: "Flava Flav", payroll: true, experience: 4)
    @instructor_3 = @dojo.instructors.create!(name: "Bill", payroll: false, experience: 5)

    visit "/instructors"
  end
  describe 'when i visit /instructors' do
    it  'shows the name of each instructor + attributes' do
      expect(page).to have_content(@instructor.name)
      expect(page).to have_content(@instructor.payroll)
      expect(page).to have_content(@instructor.experience)
    end

    it 'has a link that goes to the dojos index' do
      click_link "Dojos Index"

      expect(current_path).to eq("/dojos")
    end

    it 'shows only the instructors on payroll' do
      expect(page).to have_content(@instructor.name)
      expect(page).to have_content(@instructor_2.name)
      expect(page).to_not have_content(@instructor_3.name)
    end
  end
end
