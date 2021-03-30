# frozen_string_literal: true

class AppController < ApplicationController
  include AppHelper
  skip_before_action :verify_authenticity_token
  before_action :decode_url, only: [:show]
  before_action :encode_url, only: [:create]

  def show
    redirect_to @website.url
  end

  def create
    render json: @short
  end

  private

  def decode_url
    @website = ShortenedUrl.find_by(short: params[:url])
  end

  def encode_url
    @short = ShortenedUrl.find_or_create_by(url: params[:url]) do |short|
      short.short = generate_random_hash
    end
  end
end
