require "rails_helper"

# Feature: Home page
#   As a visitor
#   I want to visit a home page
#   So I can learn more about the website
feature 'Home page' do

  # Scenario: Visit the home page
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see companies
  scenario 'visit the home page' do
    get root_path
    page.should render_template '/company/companies'
  end

  # Scenario: Visit the home page
  #   Given I am a visitor
  #   When I search for company name of "Apple"
  #   Then I see "Apple" company
  scenario 'User searches for a company' do
    visit root_path

    fill_in "name", :with => "Apple"
    click_button "Search"

    expect("name").to have_content("Apple")
  end

end
