# frozen_string_literal: true

require 'rails_helper'

describe 'the shortening process', type: :feature do
  it 'returns shortened url with user input' do
    visit root_path
    sleep(2)
    fill_in 'input', with: 'www.google.com'
    sleep(2)
    click_button 'The Big Short'
    sleep(2)
    expect(page).to have_content 'localhost:3000/www.google.com'
  end
end

describe 'the shortening process', type: :feature do
  it 'redirects user when visiting shortened url' do
    visit root_path
    sleep(2)
    fill_in 'input', with: 'fdsa'
    sleep(2)
    click_button 'The Big Short'
    sleep(2)
    click_link 'localhost:3000/fdsa'
    sleep(2)
    expect(page).to have_content "Honey, let's shrink the urls!"
  end

  it 'redirects user to google if url is asdf' do
    visit root_path
    sleep(2)
    fill_in 'input', with: 'asdf'
    sleep(2)
    click_button 'The Big Short'
    sleep(2)
    click_link 'localhost:3000/asdf'
    sleep(2)
    expect(page).to have_content 'Gmail'
  end
end
