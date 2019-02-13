require 'database_helper'
require_relative '../spec_helper.rb'

feature 'anonymous (not logged in) users cannot access space creation tools' do

  scenario "anonymous user can't see my spaces button" do
    visit('/')
    expect(page).to_not have_button('My Spaces')
  end

  scenario 'users who try to browser access are re-driected' do
    visit('/my-spaces')
    expect(page).to have_current_path('/')
    visit('/space-creator')
    expect(page).to have_current_path('/')
    visit('/space-editor')
    expect(page).to have_current_path('/')
  end


end
