require 'rails_helper'

RSpec.describe 'dojo edit' do
  before :each do
    @dojo = Dojo.create!(name: "Blue Fist", open: true, rating: 2)
  end
  it 'links to the edit page' do

    visit "/dojos/#{@dojo.id}"

    click_link "Update #{@dojo.name}"
    expect(current_path).to eq("/dojos/#{@dojo.id}/edit")
  end

  it 'can edit the dojo' do
    visit "/dojos/#{@dojo.id}/edit"

    fill_in(:name, with: "Maroon Elbow")
    fill_in(:open, with: 'false')
    fill_in(:rating, with: '5')
    click_button('Update Dojo')

    expect(current_path).to eq("/dojos/#{@dojo.id}")
    expect(page).to have_content("Maroon Elbow")
  end
end
