require_relative '../app/lib/space.rb'
require 'database_helper'

describe Space do
  before(:each) do
    database_wiper
  end

  it 'can create a space object' do
    space = Space.new(
      space_name: "Makers",
      description:"Awesome",
      price: 25.00
    )
    expect(space).to be_kind_of(Space)
  end

  it 'can persist a space object' do
    new_table_row = Space.create(
      space_name: "Makers",
      description:"Awesome",
      price: 25.00
    )
    expect(Space.all).to include(new_table_row)
  end
end
