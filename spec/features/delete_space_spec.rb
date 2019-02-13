require 'database_helper'
require_relative '../spec_helper.rb'

feature 'Space owner can' do

  scenario 'go to /my-spaces and delete' do
    auto_register
    create_space
    visit('/my-spaces')
    expect(page).to have_content('Mookers')
    expect(page).to have_content('Amazeballs')
    expect(page).to have_content('25')
    page.find('[name=del_Mookers]').click
    expect(page.status_code).to eq(200)
    expect(page).to_not have_content('Mookers')
    expect(page).to_not have_content('Amazeballs')
    expect(page).to_not have_content('25')
  end

end
