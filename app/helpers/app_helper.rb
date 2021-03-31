# frozen_string_literal: true

module AppHelper
  private

  def generate_random_hash
    characters = '0123456789ABCDEFGHIJKLMNPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
    string = ''
    10.times do
      string += characters[rand(characters.length).floor]
    end
    string
  end

  def scrub(url)
    http_url = %r{^(http://.)|(https://.)}.match(url) ? url : 'http://' + url
    www_url = %r{(^www.)|(://www.)}.match(http_url) ? http_url.gsub!('www.', '') : http_url
    www_url
  end
end
