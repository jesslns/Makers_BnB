require 'database_helper'

feature 'Homepage adds new places' do
  scenario 'when the user adds a new place' do
    visit('/post-space')
    fill_in('spacename', with: 'Makers')
    fill_in('price', with: '50')
    fill_in('description', with: 'Makers is awesome')
    click_button('Submit')
    expect(current_path).to eq('/')
    expect(page).to have_content('Makers')
    expect(page).to have_content('awesome')
    expect(page).to have_content('50')
  end
end
