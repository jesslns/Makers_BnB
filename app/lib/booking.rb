require 'active_record'
require 'pg'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: ENV['database'],
  host: 'localhost'
)

class Booking < ActiveRecord::Base

end
