feature 'Creating new tags for links' do

  scenario 'can save one link under a tag' do
    visit '/links/new'
    fill_in 'title', with: 'Google'
    fill_in 'url', with: 'www.google.com'
    fill_in 'tags', with: "search"
    click_button 'Save Link'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('search')
    end
  end

  scenario 'can save one link under several tags' do
    visit '/links/new'
    fill_in 'title', with: 'Google'
    fill_in 'url', with: 'www.google.com'
    fill_in 'tags', with: "search, look up"
    click_button 'Save Link'

    link = Link.first
    expect(link.tags.map(&:name)).to include('search', 'look up')
  end
end
