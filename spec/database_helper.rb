def database_wiper
  Space.destroy_all unless ENV['database'] == 'MakersBnB'
end
