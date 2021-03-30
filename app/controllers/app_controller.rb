# frozen_string_literal: true

class AppController < ApplicationController
  before_action :decode_url, only: [:show]

  def show
    redirect_to @url
  end

  private

  def decode_url
    @url = params[:url] == 'asdf' ? 'http://www.google.com' : root_path
  end
end
