feature 'Viewing links' do

  before(:each) do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.bbc.com', title: 'bbc', tags: [Tag.first_or_create(name: 'news')])
    Link.create(url: 'http://www.bubblemaking.com', title: 'making bubbles', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.bubblesoftheworld.com', title: 'world bubbles', tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario 'can see an existing link on the page' do
    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end

  scenario 'can search for a link through tags' do
    visit '/tags/bubbles'

    expect(page.status_code).to eq(200)

    within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('bbc')
      expect(page).to have_content('world bubble')
      expect(page).to have_content('making bubbles')
    end
  end
  
end
