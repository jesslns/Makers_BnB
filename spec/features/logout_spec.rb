require_relative '../spec_helper.rb'
require_relative '../web_helper.rb'

feature 'Logout:' do

  before(:each)do
    database_wiper
  end

  scenario 'User can log out' do
    auto_register
    expect(page.status_code).to eq(200)
    expect(page).to have_content('Hi thundercats!')

    click_button('Logout')
    expect(page.status_code).to eq(200)
    expect(page).to_not have_content('Hi thundercats!')
  end
end
