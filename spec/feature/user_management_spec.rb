require './spec/web_helper'

feature 'Users activities' do

  scenario 'can check the user count goes up when a new once signs up' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome ufemia@hotmail.com to The Bookmark Manager!')
    expect(User.first.email).to eq('ufemia@hotmail.com')
  end
end
