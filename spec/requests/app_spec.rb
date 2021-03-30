# frozen_string_literal: true

require 'rails_helper'

describe 'URL Shortener', type: :system do
  describe 'index page' do
    it 'shows the right content' do
      visit root_path
      sleep(2)
      expect(page).to have_content('Get Shorty')
    end
  end
  describe 'show page' do
    it 'redirects to root_path if url != asdf' do
      visit '/fdsa'
      sleep(2)
      expect(page).to have_content('Get Shorty')
    end
    it 'redirects to google if url == asdf' do
      visit '/asdf'
      sleep(2)
      expect(page).to have_content('Gmail')
    end
  end
end
