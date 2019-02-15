require_relative '../spec_helper.rb'
require_relative '../web_helper.rb'


feature 'Make bookings:' do

  before(:each)do
    database_wiper
  end

scenario 'user can book an advertised space' do
  auto_register
  create_space
  expect(page.status_code).to eq(200)
  expect(page).to have_content('Hi thundercats!')
  expect(current_path).to eq('/')

  fill_in('booking_date', with: '2019-02-14')
  click_button('Book')
  expect(page).to have_content ('My Bookings:')

end
end
