# frozen_string_literal: true

require 'rails_helper'

describe 'The URL Shortener', type: :system do
  describe 'index action' do
    before do
      visit root_path
      sleep(2)
    end

    it 'shows the right header' do
      expect(page).to have_content('The Big Short')
    end

    it 'shows the right button' do
      expect(page).to have_content('Get Shorty')
    end

    it 'shows the right message' do
      expect(page).to have_content("Honey, let's shrink some urls!")
    end
  end
end
