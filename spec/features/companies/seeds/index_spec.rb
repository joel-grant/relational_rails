require 'rails_helper'

RSpec.describe 'companies seed index' do
  before :each do
    @company = Company.create!(name: "Johnny's Seeds", accepting_orders: true, years_active: 10)
    @company_2 = Company.create!(name: "Turing Seeds", accepting_orders: false, years_active: 6)

    @seed = @company.seeds.create!(name: "Tomato", available: true, quantity: 25)
    @seed_2 = @company_2.seeds.create!(name: "Jimmy", available: false, quantity: 150)
    @seed_3 = @company.seeds.create!(name: "Jalapeno", available: true, quantity: 50)
    @seed_4 = @company.seeds.create!(name: "Onion", available: true, quantity: 200)


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

  it 'has a link that goes to the companies index' do
    click_link "Companies Index"

    expect(current_path).to eq("/companies")
  end

  it 'has a link to alphabetize the seeds' do
    click_link "Alphabetize Seeds"

    expect(current_path).to eq("/companies/#{@company.id}/seeds")
  end

  it 'can be alphabetized by name' do
    click_link "Alphabetize Seeds"

    expect(@seed_3.name).to appear_before(@seed_4.name)
    expect(@seed_4.name).to appear_before(@seed.name)
  end

  it 'has a form to input a number value' do
    expect(page).to have_content(@seed.name)
    expect(page).to have_content(@seed_3.name)
    expect(page).to have_content(@seed_4.name)

    fill_in(:quantity, with: 25)
    click_button("Return Records")

    expect(current_path).to eq("/companies/#{@company.id}/seeds")
    expect(page).to have_content(@seed_3.name)
    expect(page).to have_content(@seed_4.name)
    expect(page).to_not have_content(@seed.name)
  end
end
