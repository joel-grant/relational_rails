require 'rails_helper'

RSpec.describe 'dojo creation' do
  it 'links to a new page from the dojo index' do
    visit '/dojos'

    click_link('New Dojo')
    expect(current_path).to eq('/dojos/new')
  end

  it 'can create a new dojo' do
    visit '/dojos/new'

    fill_in(:name, with: 'Purple Elbow')
    fill_in(:open, with: 'false')
    fill_in(:rating, with: '3')
    click_button('Create Dojo')

    expect(current_path).to eq('/dojos')
    expect(page).to have_content('Purple Elbow')
  end
end
