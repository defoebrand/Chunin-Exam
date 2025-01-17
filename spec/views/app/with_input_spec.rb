describe 'the shortening process with input', type: :feature do
  before do
    visit root_path
    sleep(2)
  end
  context 'replaces the message with a' do
    domain = 'ur-shorty.herokuapp.com/'
    it 'shortened url' do
      fill_in 'input', with: 'www.google.com'
      click_button 'Get Shorty'
      sleep(2)
      expect(page).not_to have_content "Honey, let's shrink some urls!"
    end
    it 'shortened url from stored key if known' do
      fill_in 'input', with: 'www.google.com'
      click_button 'Get Shorty'
      sleep(2)
      expect(page).to have_content "#{domain}pVjPMGM5JQ"
    end
    it 'newly created short key url if input url is unknown' do
      fill_in 'input', with: 'www.yahoo.com'
      click_button 'Get Shorty'
      sleep(2)
      expect(page).not_to have_content "#{domain}pVjPMGM5JQ"
    end
  end
end
