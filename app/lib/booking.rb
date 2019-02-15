require 'active_record'
require 'pg'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: ENV['database'],
  host: 'localhost'
)

class Booking < ActiveRecord::Base

  def self.available?(space_id:, date:)
    self.where("space_id = ? AND booking_date = ?", space_id, date).first == nil
  end

end
