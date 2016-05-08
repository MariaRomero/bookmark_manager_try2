
feature 'Users activities' do
  scenario 'user signs in' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq('ufemia@hotmail.com')
    expect(page).to have_content('Welcome, ufemia@hotmail.com to The Bookmark Manager!')
  end

  scenario 'checks if password matches' do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario 'when a password does not match' do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  def sign_up(email: 'ufemia@hotmail.com', password: '12345678', password_confirmation: '12345678')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end
end
