# frozen_string_literal: true

require 'rails_helper'

describe 'the App without input', type: :feature do
  before do
    visit root_path
    sleep(2)
  end
  it 'shows The Big Short in the header' do
    expect(page).to have_content('The Big Short')
  end
  it 'shows Get Shorty on the button' do
    expect(page).to have_content('Get Shorty')
  end
  it `displays "Honey, let's shrink the urls!"` do
    expect(page).to have_content "Honey, let's shrink the urls!"
  end
  it 'does not display a shortened link without user input' do
    expect(page).not_to have_content 'ur-shorty.herokuapp.com/'
  end
end
