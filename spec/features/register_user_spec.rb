require_relative '../spec_helper.rb'

feature 'Register users:' do

  scenario 'Can register a new user' do
    visit('/')
    click_button('Register')
    fill_in('username', with: 'thundercats')
    fill_in('email', with: 'thundercats@aol.com')
    fill_in('password', with: 'secretCats')
    click_button('Submit')

    expect(page.status_code).to eq(200)
    expect(page).to have_content('Hi thundercats!')
  end
end
