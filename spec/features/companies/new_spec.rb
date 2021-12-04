require 'rails_helper'

RSpec.describe 'company creation' do
  it 'links to a new page from the company index' do
    visit '/companies'

    click_link('New Company')
    expect(current_path).to eq('/companies/new')
  end

  it 'can create a new company' do
    visit '/companies/new'

    fill_in(:name, with: 'Fists of Seeds')
    fill_in(:accepting_orders, with: 'true')
    fill_in(:years_active, with: '5')
    click_button('Create Company')

    expect(current_path).to eq('/companies')
    expect(page).to have_content('Fists of Seeds')
  end
end



# [ ] done
#
# User Story 11, Parent Creation (x2)
#
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.
