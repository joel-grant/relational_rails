require 'rails_helper'

RSpec.describe 'company edit' do
  before :each do
    @company = Company.create!(name: "Johnny's Seeds", accepting_orders: true, years_active: 10)
  end
  it 'links to the edit page' do

    visit "/companies/#{@company.id}"

    click_link "Update #{@company.name}"
    expect(current_path).to eq("/companies/#{@company.id}/edit")
  end

  it 'can edit the company' do
    visit "/companies/#{@company.id}/edit"

    fill_in(:name, with: 'Fistfuls of Seeds')
    fill_in(:accepting_orders, with: 'true')
    fill_in(:years_active, with: '5')
    click_button('Update Company')

    expect(current_path).to eq("/companies/#{@company.id}")
    expect(page).to have_content('Fistfuls of Seeds')
  end
end


# [ ] done
#
# User Story 12, Parent Update (x2)
#
# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
