require_relative '../app/lib/space.rb'
require_relative '../app/lib/user.rb'
require_relative '../app/lib/booking.rb'
require 'database_helper'

describe Booking do
before(:each) do
  User.create(
    username: "MakersPerson",
    email:"Awesome@aol.com",
    pass_hash: "DoesntKnow"
  )
  Space.create(
    space_name: "Makers",
    description:"Awesome",
    price: 25.00,
    owner_id: User.find_by(username: "MakersPerson")
  )
end
  it 'can make a booking'do
  booking = Booking.new(
    user_id: 1,
    space_id: 1,
    booking_date: Time.parse("14/02/2019")
  )
end

end
