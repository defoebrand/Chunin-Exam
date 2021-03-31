# frozen_string_literal: true

require 'rails_helper'

describe 'The URL Shortener', type: :system do
  describe 'create action' do
    before do
      sleep(2)
    end
    context "creates a shortened url, if it's not already stored," do
      it 'unique to all other keys' do
        keys = ShortenedUrl.all.collect { |key| key['short'] }
        post '/app', params: { url: 'www.yahoo.com' }
        @response = JSON.parse(response.body)
        expect(keys).not_to include(@response['short'])
      end
      it 'with a default click_count of 0' do
        post '/app', params: { url: 'www.yahoo.com' }
        @response = JSON.parse(response.body)
        expect(@response['click_count']).to eq(0)
      end
    end
  end
end

describe 'The URL Shortener', type: :system do
  describe 'create action' do
    before do
      sleep(2)
    end
    it "finds a shortened url, if it's already stored" do
      google_key = ShortenedUrl.find_by(url: 'http://google.com')
      post '/app', params: { url: 'www.google.com' }
      @response = JSON.parse(response.body)
      expect(@response['short']).to eq(google_key['short'])
    end
  end
end

describe 'The URL Shortener', type: :system do
  describe 'create action' do
    before do
      sleep(2)
    end
    context 'adds http:// if it is not present' do
      it 'and scrubs www from url beginnings' do
        post '/app', params: { url: 'www.yahoo.com' }
        @response = JSON.parse(response.body)
        expect(@response['url']).to eq('http://yahoo.com')
      end
      it 'and ignores the lack of www at the beginning of a url' do
        post '/app', params: { url: 'yahoo.com' }
        @response = JSON.parse(response.body)
        expect(@response['url']).to eq('http://yahoo.com')
      end
    end
  end
end

describe 'The URL Shortener', type: :system do
  describe 'create action' do
    before do
      sleep(2)
    end
    context 'only stores http:// once, even if it is supplied' do
      it 'and scrubs www from url beginnings' do
        post '/app', params: { url: 'http://www.yahoo.com' }
        @response = JSON.parse(response.body)
        expect(@response['url']).to eq('http://yahoo.com')
      end
      it 'and ignores the lack of www at the beginning of a url' do
        post '/app', params: { url: 'http://yahoo.com' }
        @response = JSON.parse(response.body)
        expect(@response['url']).to eq('http://yahoo.com')
      end
    end
  end
end

describe 'The URL Shortener', type: :system do
  describe 'create action' do
    before do
      sleep(2)
    end
    context 'stores https:// if it is supplied' do
      it 'and scrubs www from url beginnings' do
        post '/app', params: { url: 'https://www.yahoo.com' }
        @response = JSON.parse(response.body)
        expect(@response['url']).to eq('https://yahoo.com')
      end
      it 'and ignores the lack of www at the beginning of a url' do
        post '/app', params: { url: 'https://yahoo.com' }
        @response = JSON.parse(response.body)
        expect(@response['url']).to eq('https://yahoo.com')
      end
      it 'without conflicting with similar http:// element' do
        post '/app', params: { url: 'https://yahoo.com' }
        @s_response = JSON.parse(response.body)
        post '/app', params: { url: 'http://yahoo.com' }
        @no_s_response = JSON.parse(response.body)
        expect(@s_response['short']).not_to eq(@no_s_response['short'])
      end
    end
  end
end
