require 'active_record'
require 'pg'
require_relative './space.rb'

def get_space_owners

  spaces = Space.all
  all_users = User.all
  @space_owners = {}
  spaces.each { |space|  @space_owners[space] = all_users.find(space.owner_id).username }
  return @space_owners

end
