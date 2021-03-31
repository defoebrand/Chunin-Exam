# frozen_string_literal: true

class AppController < ApplicationController
  include AppHelper
  skip_before_action :verify_authenticity_token
  def index
    @short = @short if @short
  end

  def show
    puts 'show'
    puts params
    @website = ShortenedUrl.find_by(short: params[:url])
    if @website
      @website.click_count = @website.click_count + 1
      @website.save
    end
    redirect_to @website ? @website.url : root_path
  end

  def create
    puts 'create'
    puts shorty_params
    url = scrub(shorty_params[:url])
    @short = ShortenedUrl.find_or_create_by(url: url) do |short|
      short.short = generate_random_hash
    end
    render 'app/index' # json: @short
    # redirect_to show_path
  end

  private

  def shorty_params
    params.require(:shortener).permit(:url)
  end
end
