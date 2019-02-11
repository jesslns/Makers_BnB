require 'active_record'
require 'pg'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: ENV['database'],
  host: 'localhost'
)

class Space < ActiveRecord::Base
end
