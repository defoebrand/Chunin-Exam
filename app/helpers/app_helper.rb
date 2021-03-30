# frozen_string_literal: true

module AppHelper
  def generate_random_hash
    characters = '0123456789ABCDEFGHIJKLMNPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
    string = ''
    10.times do
      string += characters[rand(characters.length).floor]
    end
    string
  end
end
