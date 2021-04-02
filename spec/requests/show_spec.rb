require 'rails_helper'

describe 'The URL Shortener', type: :system do
  describe 'show action' do
    it 'redirects to root_path if short key is not registered' do
      visit '/fdsa'
      sleep(2)
      expect(page).to have_content('The Big Short')
    end

    it 'redirects to google.com if short key matches stored google.com key' do
      visit '/pVjPMGM5JQ'
      sleep(2)
      expect(page).to have_content('Gmail')
    end

    it 'redirects to bing.com if short key matches stored bing.com key' do
      visit '/DN6pGMziXz'
      sleep(2)
      expect(page).to have_content('MSN')
    end

    it 'adds to click_counter of associated element' do
      bing = ShortenedUrl.find_by(short: 'DN6pGMziXz')
      expect(bing.click_count).to eq(0)
      visit '/DN6pGMziXz'
      sleep(2)
      bing = ShortenedUrl.find_by(short: 'DN6pGMziXz')
      expect(bing.click_count).to eq(1)
    end
  end
end
