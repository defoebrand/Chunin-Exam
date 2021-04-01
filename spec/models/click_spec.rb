# frozen_string_literal: true

require 'rails_helper'

google_key = ['1lBbbeMao6', 'http://google.com']

RSpec.describe 'Click Model', type: :model do
  let(:good_url) do
    ShortenedUrl.create(short: google_key[0], url: google_key[1])
  end
  let(:good_click) do
    Click.new(shortened_url: good_url, user_agent: 'TestString', language: 'TestString').save
  end
  let(:bad_click) do
    Click.new(user_agent: 'TestString', language: 'TestString').save
  end

  context 'positive validation test' do
    it 'validates presence of shortened_url' do
      expect(good_click).to eq(true)
    end
  end
  context 'negative validation test' do
    it 'validates presence of shortened_url' do
      expect(bad_click).to eq(false)
    end
  end
end

RSpec.describe 'Creator Model', type: :model do
  let(:good_url) do
    ShortenedUrl.create(short: google_key[0], url: google_key[1])
  end
  let(:no_lang) do
    Creator.new(shortened_url: good_url, user_agent: 'TestString').save
  end
  let(:no_agent) do
    Creator.new(shortened_url: good_url, language: 'TestString').save
  end
  context "doesn't require additional data. " do
    it 'It stores a creator with max_touch_points missing' do
      expect(no_lang).to eq(true)
    end
    it 'It stores a creator with user_agent missing' do
      expect(no_agent).to eq(true)
    end
  end
end
