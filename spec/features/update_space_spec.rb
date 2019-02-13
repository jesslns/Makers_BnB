require 'database_helper'
require_relative '../spec_helper.rb'

feature 'Space owner can' do
  scenario 'go to /my-spaces' do
    add_sample_data
    visit('/my-spaces')
    expect(page.status_code).to eq(200)
  end

  scenario 'go to /my-spaces, click update on a space & go to a page with that space info' do
    add_sample_data
    visit('/my-spaces')
    expect(page).to have_content('Mookers')
    expect(page).to have_content('Amazeballs')
    expect(page).to have_content('25.0')
    page.find('[name=edit_Mookers]').click
    expect(page.status_code).to eq(200)
  end

  scenario 'go to /my-spaces, then to /update-space, make changes and see the changes in /my-spaces' do
    add_sample_data
    visit('/my-spaces')
    page.find('[name=edit_Mookers]').click
    expect(current_path).to eq('/space-editor')
    expect(page.status_code).to eq(200)
    fill_in('spacename', with: 'Musketeers')
    fill_in('price', with: '111')
    fill_in('description', with: 'Where the Three Musketeers used to live')
    click_button('Submit')
    expect(current_path).to eq('/my-spaces')
    expect(page).to have_content('Musketeers')
    expect(page).to have_content('Where the Three Musketeers used to live')
    expect(page).to have_content('111')
  end

end