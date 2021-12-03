require 'rails_helper'

RSpec.describe 'companies seed index' do
  before :each do 
    @company = Company.create!(name: "Johnny's Seeds", accepting_orders: true, years_active: 10)
    @company_2 = Company.create!(name: "Turing Seeds", accepting_orders: false, years_active: 6)

    @seed = @company.seeds.create!(name: "Jessica", available: true, quantity: 3)
    @seed_2 = @company_2.seeds.create!(name: "Jimmy", available: false, quantity: 55)

    visit "/companies/#{@company.id}/seeds"
  end 
  it 'shows all seeds that are sold by the company' do
    expect(page).to have_content(@seed.name)
    expect(page).to have_content(@seed.available)
    expect(page).to have_content(@seed.quantity)

    expect(page).to_not have_content(@seed_2.name)
    expect(page).to_not have_content(@seed_2.available)
    expect(page).to_not have_content(@seed_2.quantity)
  end

  it 'has a link that goes to the seeds index' do 
    click_link "Seeds Index"

    expect(current_path).to eq("/seeds")
  end 
end
