# frozen_string_literal: true

RSpec.describe do
  ShortenedUrl.find_or_create_by(short: 'DN6pGMziXz', url: 'http://bing.com')
  ShortenedUrl.find_or_create_by(short: 'pVjPMGM5JQ', url: 'http://google.com')
end
