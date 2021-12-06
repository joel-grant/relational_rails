require 'rails_helper'

RSpec.describe Instructor do
  before :each do
    @dojo = Dojo.create!(name: "Blue Fist", open: true, rating: 2)
    @instructor = @dojo.instructors.create!(name: "Jessica", payroll: true, experience: 3)
    @instructor_2 = @dojo.instructors.create!(name: "Flava Flav", payroll: true, experience: 4)
    @instructor_3 = @dojo.instructors.create!(name: "Tila Tequila", payroll: false, experience: 5)
  end
  it { should belong_to :dojo }

  it 'only returns the instructors with a true value as its boolean' do
    instructors = [@instructor, @instructor_2]
    expect(Instructor.return_true).to eq(instructors)
  end

  it 'can alphabetize the instructors by name' do
    instructors = [@instructor_2, @instructor, @instructor_3]
    expect(Instructor.alphabetize(@dojo.id)).to eq(instructors)
  end
end
