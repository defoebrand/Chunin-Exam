require 'rails_helper'

google_key = ['1lBbbeMao6', 'http://google.com']

RSpec.describe ShortenedUrl, type: :model do
  let(:missing_short) do
    ShortenedUrl.new(url: google_key[1]).save
  end
  let(:missing_url) do
    ShortenedUrl.new(short: google_key[0]).save
  end

  context 'short key negative validation test' do
    it 'validates requirement of short key' do
      expect(missing_short).to eq(false)
    end
  end

  context 'url negative validation test' do
    it 'validates requirement  of url' do
      expect(missing_url).to eq(false)
    end
  end
end

RSpec.describe ShortenedUrl, type: :model do
  let(:good_key) do
    ShortenedUrl.new(short: google_key[0], url: google_key[1]).save
  end
  let(:duplicate_short) do
    ShortenedUrl.new(short: google_key[0], url: 'www.yahoo.com').save
  end
  let(:create_entry) do
    ShortenedUrl.create(short: google_key[0], url: google_key[1])
  end

  context 'positive validation test' do
    it 'validates presence of url and short key' do
      expect(good_key).to eq(true)
    end
  end

  context 'missing url validation test' do
    it 'validates presence of unique short key' do
      good_key
      expect(duplicate_short).to eq(false)
    end
  end

  context 'items return' do
    it 'instantiated with a default click_count of 0' do
      expect(create_entry.click_count).to eq(0)
    end
  end
end
