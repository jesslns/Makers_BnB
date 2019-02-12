require 'database_helper'
require_relative '../spec_helper.rb'

feature 'Space owner can' do

  scenario 'go to /my-spaces, click update on a space & go to a page with that space info' do
    add_sample_data
  end

  scenario 'go to /my-spaces, then to /update-space, make changes and see the changes in /my-spaces' do
    add_sample_data
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
