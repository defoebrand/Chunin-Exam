class AppController < ApplicationController
  include AppHelper
  skip_before_action :verify_authenticity_token

  def show
    @website = ShortenedUrl.find_by(short: params[:url])
    count_click if @website
    redirect_to @website ? @website.url : root_path
  end

  def create
    url = scrub(params[:url])
    @short = ShortenedUrl.find_or_create_by(url: url) do |short|
      short.short = generate_random_hash
    end
    add_creator(params[:data])
    render json: {
      short: @short.short,
      url: @short.url,
      click_count: @short.click_count
    }
  end
end
