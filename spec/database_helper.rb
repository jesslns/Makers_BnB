def database_wiper
  ActiveRecord::Base.connection_pool.with_connection do |conn|
    conn.execute("TRUNCATE users, spaces, bookings RESTART IDENTITY") unless ENV['database'] == 'MakersBnB'
  end
  # ActiveRecord::Base.connection.execute("TRUNCATE TABLE users, spaces, bookings RESTART IDENTITY") unless ENV['database'] == 'MakersBnB'
  # Space.destroy_all unless ENV['database'] == 'MakersBnB'
  # User.destroy_all unless ENV['database'] == 'MakersBnB'
  # Booking.destroy_all unless ENV['database'] == 'MakersBnB'
end

def add_sample_data
  Space.create(
    space_name: "Mookers",
    description:"Amazeballs",
    price: 25.00
  )
end
