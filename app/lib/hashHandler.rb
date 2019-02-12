require 'bcrypt'

class HashHandler
  def to_hash(password)
    return BCrypt::Password.create(password).to_s
  end

  def authenticate(password,pass_hash)
    @passhash = BCrypt::Password.new(pass_hash)
    return (@passhash == password)
  end

end
