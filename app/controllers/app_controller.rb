# frozen_string_literal: true

class AppController < ApplicationController
  include AppHelper
  skip_before_action :verify_authenticity_token

  def show
    @website = ShortenedUrl.find_by(short: params[:url])
    if @website
      @website.click_count = @website.click_count + 1
      @website.save
    end
    redirect_to @website ? @website.url : root_path
  end

  def create
    url = scrub(params[:url])
    @short = ShortenedUrl.find_or_create_by(url: url) do |short|
      short.short = generate_random_hash
    end
    render json: {
      short: @short.short,
      url: @short.url,
      click_count: @short.click_count
    }
  end
end
