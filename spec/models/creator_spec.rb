# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Creator Model', type: :model do
  let(:good_url) do
    ShortenedUrl.create(short: '1lBbbeMao6', url: 'http://google.com')
  end
  let(:good_create) do
    Creator.new(shortened_url: good_url, max_touch_points: 0,
                user_agent: 'TestString', language: 'TestString',
                platform: 'TestString').save
  end
  let(:bad_create) do
    Creator.new(max_touch_points: 0, user_agent: 'TestString',
                language: 'TestString', platform: 'TestString').save
  end

  context 'positive validation test' do
    it 'validates presence of shortened_url' do
      expect(good_create).to eq(true)
    end
  end
  context 'negative validation test' do
    it 'validates presence of shortened_url' do
      expect(bad_create).to eq(false)
    end
  end
end

RSpec.describe 'Creator Model', type: :model do
  let(:good_url) { ShortenedUrl.create(short: '1lBbbeMao6', url: 'http://google.com') }
  let(:no_touch) do
    Creator.new(shortened_url: good_url, user_agent: 'TestString', language: 'TestString', platform: 'TestString').save
  end
  let(:no_agent) do
    Creator.new(shortened_url: good_url, max_touch_points: 0, language: 'TestString', platform: 'TestString').save
  end
  context "doesn't require additional data. " do
    it 'It stores a creator with max_touch_points missing' do
      expect(no_touch).to eq(true)
    end
    it 'It stores a creator with user_agent missing' do
      expect(no_agent).to eq(true)
    end
  end
end

RSpec.describe 'Creator Model', type: :model do
  let(:good_url) { ShortenedUrl.create(short: '1lBbbeMao6', url: 'http://google.com') }
  let(:no_lang) do
    Creator.new(shortened_url: good_url, max_touch_points: 0, user_agent: 'TestString', platform: 'TestString').save
  end
  let(:no_plat) do
    Creator.new(shortened_url: good_url, max_touch_points: 0, user_agent: 'TestString', language: 'TestString').save
  end
  context "doesn't require additional data. " do
    it 'It stores a creator with language missing' do
      expect(no_lang).to eq(true)
    end
    it 'It stores a creator with platform missing' do
      expect(no_plat).to eq(true)
    end
  end
end
