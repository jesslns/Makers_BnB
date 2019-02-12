require 'database_helper'
require_relative '../spec_helper.rb'

feature 'Space owner can go to a page to change a space listing' do
  scenario 'when he wants to' do
    add_sample_data
    visit('/my-spaces')
    expect(page.status_code).to eq(200)

    # click_button('Update')
    # expect(current_path).to eq('/update-space')
  end
end