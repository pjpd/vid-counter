class StaticPagesController < ApplicationController
  def home
  end

  def submit
    @video_url = params[:website_url]
    agent = Mechanize.new
    agent.get @video_url
    @view_count = agent.page.at(".watch-view-count").text.split(" ")[0]
  end
end
