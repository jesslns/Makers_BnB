require 'database_helper'
require 'web_helper'
require_relative '../spec_helper.rb'

feature 'user sees only their spaces on my spaces' do
  before(:each)do
    database_wiper
  end

  scenario "one user creates a space, other creates a space" do
    visit('/')
    auto_register
    create_space
    click_button("Logout")
    expect(page).to have_content('Mookers')
    expect(page).to have_content('Amazeballs')
    expect(page).to have_content('25')
    register("ourdude")
    create_space_manual("somethingdifferent")
    create_space_manual("somethingelsedifferent")
    visit('/')
    expect(page).to have_content('Mookers')
    expect(page).to have_content('Amazeballs')
    expect(page).to have_content('somethingdifferent')
    click_button("My Spaces")
    expect(page).to have_content('somethingdifferent')
    expect(page).to have_content('somethingelsedifferent')
    expect(page).to_not have_content('Mookers')
  end

end
