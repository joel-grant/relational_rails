require 'rails_helper'

RSpec.describe Instructor do
  it { should belong_to :dojo }

  it 'only returns the instructors with a true value as its boolean' do
    dojo = Dojo.create!(name: "Blue Fist", open: true, rating: 2)
    instructor = dojo.instructors.create!(name: "Jessica", payroll: true, experience: 3)
    instructor_2 = dojo.instructors.create!(name: "Flava Flav", payroll: true, experience: 4)
    instructor_3 = dojo.instructors.create!(name: "Bill", payroll: false, experience: 5)

    instructors = [instructor, instructor_2]
    expect(Instructor.return_true).to eq(instructors)
  end
end
