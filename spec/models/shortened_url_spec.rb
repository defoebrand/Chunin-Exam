# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShortenedUrl, type: :model do
  goog_key = ['1lBbbeMao6', 'http://google.com']
  new_url = 'www.yahoo.com'
  let(:no_short) { ShortenedUrl.new(url: goog_key[1]).save }
  let(:no_url) { ShortenedUrl.new(short: goog_key[0]).save }
  let(:good_key) { ShortenedUrl.new(short: goog_key[0], url: goog_key[1]).save }
  let(:dup_short) { ShortenedUrl.new(short: goog_key[0], url: new_url).save }
  let(:good_save) { ShortenedUrl.create(short: goog_key[0], url: goog_key[1]) }

  context 'short key negative validation test' do
    it 'validates requirement of short key' do
      expect(no_short).to eq(false)
    end
  end

  context 'url negative validation test' do
    it 'validates requirement  of url' do
      expect(no_url).to eq(false)
    end
  end

  context 'positive validation test' do
    it 'validates presence of url and short key' do
      expect(good_key).to eq(true)
    end
  end

  context 'missing url validation test' do
    it 'validates presence of unique short key' do
      good_key
      expect(dup_short).to eq(false)
    end
  end

  context 'items return' do
    it 'instantiated with a default click_count of 0' do
      expect(good_save.click_count).to eq(0)
    end
  end
end
