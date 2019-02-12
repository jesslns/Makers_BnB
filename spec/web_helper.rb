
def auto_register
  visit("/")
  click_button('Register')
  fill_in('username', with: 'thundercats')
  fill_in('email', with: 'thundercats@aol.com')
  fill_in('password', with: 'secretCats')
  click_button('Submit')
end
