class StaticPagesController < ApplicationController
  def home
  end

  def submit
    begin
      @video_url = params[:website_url]
      agent = Mechanize.new
      agent.get @video_url

      @view_count = agent.page.at(".watch-view-count").text.split(" ")[0]
      @video_title = agent.page.at("//title").text.split(" - ")[0]
    rescue
      # If someone submits a non-youtube url, the above is likely to fail.
      # That person is probably Barry.
      # Send him somewhere not on this site.
      redirect_to "https://www.gsb.stanford.edu/faculty-research/working-papers/defining-minimum-winning-game-high-technology-ventures"
    end
  end
end
