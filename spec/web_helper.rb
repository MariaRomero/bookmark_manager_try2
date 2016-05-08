def sing_up
  visit 'users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'ufemia@hotmail.com'
  fill_in :password, with: 'arepa'
  click_button 'Sign up'
end  
