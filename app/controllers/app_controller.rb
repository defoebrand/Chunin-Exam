# frozen_string_literal: true

class AppController < ApplicationController
  include AppHelper
  skip_before_action :verify_authenticity_token

  def show
    @website = ShortenedUrl.find_by(short: params[:url])
    redirect_to @website.url
  end

  def create
    url = scrub(params[:url])
    @short = ShortenedUrl.find_or_create_by(url: url) do |short|
      short.short = generate_random_hash
    end
    render json: @short
  end
end
