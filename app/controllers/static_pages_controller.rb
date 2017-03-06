class StaticPagesController < ApplicationController
  def home
  end

  def submit
    @video_url = params[:website_url]
  end
end
