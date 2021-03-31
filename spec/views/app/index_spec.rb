# frozen_string_literal: true

require 'rails_helper'

describe 'the shortening process', type: :feature do
  before do
    visit root_path
    sleep(2)
  end
  it `displays "Honey, let's shrink the urls!"` do
    expect(page).to have_content "Honey, let's shrink the urls!"
  end
  it 'does not display a shortened link without user input' do
    expect(page).not_to have_content 'localhost:3000/'
  end
  it 'replaces message with shortened url' do
    fill_in 'input', with: 'www.google.com'
    sleep(2)
    click_button 'Get Shorty'
    sleep(2)
    expect(page).not_to have_content "Honey, let's shrink the urls!"
  end
  it 'replaces message with shortened url from stored key if known' do
    fill_in 'input', with: 'www.google.com'
    sleep(2)
    click_button 'Get Shorty'
    sleep(2)
    expect(page).to have_content 'localhost:3000/pVjPMGM5JQ'
  end
  it 'replaces message with shortened url from stored key if known' do
    fill_in 'input', with: 'www.bing.com'
    sleep(2)
    click_button 'Get Shorty'
    sleep(2)
    expect(page).to have_content 'localhost:3000/DN6pGMziXz'
  end
  it 'replaces message with newly created short key url if input url is unknown' do
    fill_in 'input', with: 'www.yahoo.com'
    sleep(2)
    click_button 'Get Shorty'
    sleep(2)
    expect(page).not_to have_content 'localhost:3000/pVjPMGM5JQ'
  end
end
