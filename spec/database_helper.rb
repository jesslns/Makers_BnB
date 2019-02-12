def database_wiper
  Space.destroy_all unless ENV['database'] == 'MakersBnB'
end

def add_sample_data
  Space.create(
    space_name: "Mookers",
    description:"Amazeballs",
    price: 25.00
  )
end
