require 'rails_helper'

RSpec.describe 'dojos instructor index' do
  before :each do
    @dojo = Dojo.create!(name: "Blue Fist", open: true, rating: 2)
    @dojo_2 = Dojo.create!(name: "Fist of Truth", open: false, rating: 4)

    @instructor = @dojo.instructors.create!(name: "Jessica", payroll: true, experience: 3)
    @instructor_2 = @dojo_2.instructors.create!(name: "Jimmy", payroll: false, experience: 55)
    @instructor_3 = @dojo.instructors.create!(name: "Flava Flav", payroll: false, experience: 55)
    @instructor_4 = @dojo.instructors.create!(name: "Tila Tequila", payroll: true, experience: 60)


    visit "/dojos/#{@dojo.id}/instructors"
  end
  it 'shows all instructors associated with the Dojo' do
    expect(page).to have_content(@instructor.name)
    expect(page).to have_content(@instructor.payroll)
    expect(page).to have_content(@instructor.experience)

    expect(page).to_not have_content(@instructor_2.name)
  end

  it 'has a link that goes to the instructors index' do
    click_link "Instructors Index"

    expect(current_path).to eq("/instructors")
  end

  it 'has a link that goes to the dojos index' do
    click_link "Dojos Index"

    expect(current_path).to eq("/dojos")
  end

  it 'has a link to alphabetize the instructors' do
    click_link "Alphabetize Instructors"

    expect(current_path).to eq("/dojos/#{@dojo.id}/instructors")
  end

  it 'can be alphabetized by name' do
    click_link "Alphabetize Instructors"

    expect(@instructor_3.name).to appear_before(@instructor.name)
    expect(@instructor.name).to appear_before(@instructor_4.name)
  end

  it 'has a link in index page to edit' do 
    click_link "Update #{@instructor.name}"

    expect(current_path).to eq("/instructors/#{@instructor.id}/edit")
  end 

  it 'has a form to fill out instructor info' do 
    visit "/instructors/#{@instructor.id}/edit"

    fill_in(:name, with: "SeedMan")
    fill_in(:payroll, with: true)
    fill_in(:experience, with: 32)

    click_button "Update #{@instructor.name}"

    expect(current_path).to eq("/instructors/#{@instructor.id}")
    expect(page).to have_content("SeedMan")

  end 
end
