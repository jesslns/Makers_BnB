require_relative '../spec_helper.rb'

feature 'Website tests:' do

  scenario 'the homepage loads OK' do
    visit('/')
    expect(page.status_code).to eq(200)
    expect(page).to have_content('MakersBnB')
  end
end