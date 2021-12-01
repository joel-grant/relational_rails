require 'rails_helper'

RSpec.describe 'Instructor Index Page' do 
  describe 'when i visit /instructors' do 
    it  'shows the name of each instructor + attributes' do 
      instructor = Instructor.create!(name: "Jessica", payroll: true, experience: 3)
      visit "/instructors"

      expect(page).to have_content(instructor.name)
      expect(page).to have_content(instructor.payroll)
      expect(page).to have_content(instructor.experience)
    end 
  end 
end 