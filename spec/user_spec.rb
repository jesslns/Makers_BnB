require_relative '../app/lib/user.rb'
require 'database_helper'

describe User do
  before(:each) do
    database_wiper
  end

  it 'can create a user' do
    user = User.new(
      username: "Makers",
      email:"Awesome@aol.com",
      pass_hash: "DoesntKnow"
    )
    expect(user).to be_kind_of(User)
  end

  it 'can persist a user object' do
    new_table_row = User.create(
      username: "Makers",
      email:"Awesome@aol.com",
      pass_hash: "DoesntKnow"
    )
    expect(User.all).to include(new_table_row)
  end
end
