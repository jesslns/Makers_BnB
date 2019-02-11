require 'database_helper'

feature 'Homepage displays spaces' do

  scenario 'when you first visit' do
    add_sample_data
    visit('/')
    # expect(page.status_code).to eq(200)
    expect(page).to have_content('Mookers')
    expect(page).to have_content('Amazeballs')
  end
end
