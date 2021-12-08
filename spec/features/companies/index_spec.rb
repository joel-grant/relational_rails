require 'rails_helper'

RSpec.describe 'company index page' do
  before :each do
    @company = Company.create!(name: "Johnny's Seeds", accepting_orders: true, years_active: 10)
    @company_2 = Company.create!(name: "Turing Seeds", accepting_orders: false, years_active: 12)
    @company_3 = Company.create!(name: "Seeds of Fury", accepting_orders: true, years_active: 1)

    visit "/companies"
  end
  describe 'when I visit /companies' do
    it 'shows the name of each parent record' do
      expect(page).to have_content(@company.name)
    end

    it 'returns the name of each company in order of most recently created' do
      expect(@company.name).to appear_before(@company_2.name)
      expect(@company_2.name).to appear_before(@company_3.name)
    end

    it 'has a link that goes to the seeds index' do
      click_link "Seeds Index"

      expect(current_path).to eq("/seeds")
    end

    it 'has a link by each company to update' do
      click_link "Edit #{@company.name}"

      expect(current_path).to eq("/companies/#{@company.id}/edit")
    end

    it 'takes user to form to update company info' do
      visit "/companies/#{@company.id}/edit"

      fill_in(:name, with: "SeedMan")
      fill_in(:accepting_orders, with: true)
      fill_in(:years_active, with: 32)

      click_button "Update Company"

      expect(current_path).to eq("/companies/#{@company.id}")
      expect(page).to have_content("SeedMan")
    end

    it 'has a link next to every Company to delete that Company' do
      expect(page).to have_content(@company.name)
      expect(page).to have_content(@company_2.name)
      expect(page).to have_content(@company_3.name)

      click_link "Delete #{@company.name}"

      expect(current_path).to eq("/companies")
      expect(page).to_not have_content(@company.name)
      expect(page).to have_content(@company_2.name)
      expect(page).to have_content(@company_3.name)

      click_link "Delete #{@company_2.name}"

      expect(current_path).to eq("/companies")
      expect(page).to_not have_content(@company.name)
      expect(page).to_not have_content(@company_2.name)
      expect(page).to have_content(@company_3.name)

      click_link "Delete #{@company_3.name}"

      expect(current_path).to eq("/companies")
      expect(page).to_not have_content(@company.name)
      expect(page).to_not have_content(@company_2.name)
      expect(page).to_not have_content(@company_3.name)
    end

    it 'has a text box to filter results by keyword' do
      expect(page).to have_content(@company.name)
      expect(page).to have_content(@company_2.name)
      expect(page).to have_content(@company_3.name)

      fill_in(:keyword, with: "Joh")
      click_button "Search"

      expect(current_path).to eq("/companies")
      expect(page).to have_content(@company.name)
      expect(page).to_not have_content(@company_2.name)
      expect(page).to_not have_content(@company_3.name)
    end
  end
end
