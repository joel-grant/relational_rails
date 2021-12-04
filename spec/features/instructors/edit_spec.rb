require 'rails_helper' 

RSpec.describe 'Instructor Edit' do 
  before :each do
    @dojo = Dojo.create!(name: "Blue Fist", open: true, rating: 2)
    @dojo_2 = Dojo.create!(name: "Fist of Truth", open: false, rating: 4)

    @instructor = @dojo.instructors.create!(name: "Jessica", payroll: true, experience: 3)
    @instructor_2 = @dojo_2.instructors.create!(name: "Jimmy", payroll: false, experience: 55)

    visit "/instructors/#{@instructor.id}"
  end

  describe 'When I visit the Instructor Show Page' do 
    it 'Links to the Edit Page' do 
      click_link "Update #{@instructor.name}"

      expect(current_path).to eq("/instructors/#{@instructor.id}/edit")
    end 
  end 

  describe 'It has a form to Edit Instructors' do 
    it 'can edit and show instructor attributes' do 
      visit "/instructors/#{@instructor.id}/edit"

      fill_in(:name, with: "Mr. Miyagi")
      fill_in(:payroll, with: true)
      fill_in(:experience, with: 150)

      click_button "Update #{@instructor.name}"

      expect(current_path).to eq("/instructors/#{@instructor.id}")
      expect(page).to have_content("Mr. Miyagi")
    end 
  end
end 