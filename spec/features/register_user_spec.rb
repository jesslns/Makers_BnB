require_relative '../spec_helper.rb'
require_relative '../web_helper.rb'

feature 'Register users:' do

  before(:each)do
    database_wiper
  end

  scenario 'Can register a new user' do
    auto_register
    expect(page.status_code).to eq(200)
    expect(page).to have_content('signed in as thundercats')
  end
end
