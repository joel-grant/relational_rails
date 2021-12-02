require 'rails_helper'

RSpec.describe 'dojos instructor index' do
  it 'shows all instructors associated with the Dojo' do
    dojo = Dojo.create!(name: "Blue Fist", open: true, rating: 2)
    dojo_2 = Dojo.create!(name: "Fist of Truth", open: false, rating: 4)

    instructor = dojo.instructors.create!(name: "Jessica", payroll: true, experience: 3)
    instructor_2 = dojo_2.instructors.create!(name: "Jimmy", payroll: false, experience: 55)

    visit "/dojos/#{dojo.id}/instructors"

    expect(page).to have_content(instructor.name)
    expect(page).to have_content(instructor.payroll)
    expect(page).to have_content(instructor.experience)

    expect(page).to_not have_content(instructor_2.name)
  end
end
