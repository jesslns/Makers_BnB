require_relative '../app/lib/space.rb'
require_relative '../app/lib/user.rb'
require 'database_helper'

describe Space do
  before(:each) do
    database_wiper
    User.create(
      username: "MakersPerson",
      email:"Awesome@aol.com",
      pass_hash: "DoesntKnow"
    )
  end

  it 'can create a space object' do
    space = Space.new(
      space_name: "Makers",
      description:"Awesome",
      price: 25.00,
      owner_id: User.find_by(username: "MakersPerson")
    )
    expect(space).to be_kind_of(Space)
  end

  it 'can persist a space object' do
    new_table_row = Space.create(
      space_name: "Makers",
      description:"Awesome",
      price: 25.00,
      owner_id: User.find_by(username: "MakersPerson").id
    )
    expect(Space.all).to include(new_table_row)
  end

  it 'throws an error if trying to create a space with a non-existant
  owner_id' do
    expect{
      new_table_row = Space.create(
        space_name: "Makers",
        description:"Awesome",
        price: 25.00,
        owner_id: 9999
        #test may not work on brand new testing database
      )
    }.to raise_error()
  end
end
