require_relative './booking.rb'
require_relative './space.rb'

def booking_available? (space_id, booking_date)
      redirect('/') unless Booking.where("space_id = ? AND booking_date = ?", space_id, booking_date).first == nil
# if booking found, return an array --> false
# if booking not found, return nil --> true
end
  # if Booking.where("space_id = ? AND booking_date = ?", space_id, booking_date)
  #     redirect '/'
  # else
  #   Booking.create(
  #     user_id: user_id,
  #     space_id: space_id,
  #     booking_date: booking_date
  #   )
  #     redirect '/my-bookings'
  # end


# end
