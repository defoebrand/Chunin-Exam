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
    %r{://www.}.match(url) ? url.gsub!('://www.', '://') : url
  end
end
