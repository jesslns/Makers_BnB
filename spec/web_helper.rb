
def auto_register
  visit("/")
  click_button('Register')
  fill_in('register_username', with: 'thundercats')
  fill_in('register_email', with: 'thundercats@aol.com')
  fill_in('register_password', with: 'secretCats')
  click_button('Submit')
end

def register(name)
  visit("/")
  click_button('Register')
  fill_in('register_username', with: name)
  fill_in('register_email', with: name+'@aol.com')
  fill_in('register_password', with: 'secretCats')
  click_button('Submit')
end

def create_space()
  visit('/space-creator')
  fill_in('spacename', with: 'Mookers')
  fill_in('price', with: '25.0')
  fill_in('description', with: 'Amazeballs')
  click_button('Submit')
end

def create_space_manual(input)
  visit('/space-creator')
  fill_in('spacename', with: input)
  fill_in('price', with: '25.0')
  fill_in('description', with: input)
  click_button('Submit')
end
