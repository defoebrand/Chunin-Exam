module AppHelper
  private

  def generate_random_hash
    characters = '0123456789ABCDEFGHIJKLMNPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
    @all_shorts = ShortenedUrl.all.map(&:short)
    generate(characters)
  end

  def generate(keys, num = 10)
    string = ''
    num.times do
      string += keys[rand(keys.length).floor]
    end
    @all_shorts.include?(string) ? generate(keys, num + 1) : string
  end

  def scrub(url)
    http_url = %r{^(http://.)|(https://.)}.match(url) ? url : "http://#{url}"
    %r{(^www.)|(://www.)}.match(http_url) ? http_url.gsub('www.', '') : http_url
  end

  def count_click
    @website.update_attribute(:click_count, @website.click_count + 1)
    Click.create(
      shortened_url: @website,
      user_agent: request.env['HTTP_USER_AGENT'],
      language: request.env['HTTP_ACCEPT_LANGUAGE']
    )
  end

  def add_creator(data)
    return unless data

    Creator.create(
      shortened_url: @short,
      max_touch_points: data[:maxTouchPoints],
      user_agent: data[:userAgent],
      language: data[:language],
      platform: data[:platform]
    )
  end
end
