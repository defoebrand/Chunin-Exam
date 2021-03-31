# frozen_string_literal: true

require 'rails_helper'

describe 'The URL Shortener', type: :system do
  describe 'create action' do
    before do
      sleep(2)
    end
    it 'finds a shortened url if its already stored' do
      post '/app', params: { url: 'www.google.com' }
      expect(JSON.parse(response.body)).to include({
                                                     'short' => 'pVjPMGM5JQ',
                                                     'url' => 'http://google.com',
                                                     'click_count' => 0
                                                   })
    end
  end
end
