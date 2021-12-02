require 'rails_helper'

RSpec.describe Dojo do
  it { should have_many :instructors }

  it 'order the dojos by most recently created' do
    dojo = Dojo.create!(name: "Blue Fist", open: true, rating: 2, created_at: Time.now + 1)
    dojo_2 = Dojo.create!(name: "Fist of Truth", open: false, rating: 4, created_at: Time.now + 1.5)
    dojo_3 = Dojo.create!(name: "Fists of Fury", open: true, rating: 1, created_at: Time.now + 2)

    dojos = [dojo, dojo_2, dojo_3]
    expect(Dojo.recently_created).to eq(dojos)
  end
end
