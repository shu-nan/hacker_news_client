class NewsController < ApplicationController

  def index
    page = params[:page].blank? ? 1 : params[:page].to_i
    news_api = NewsAPI.new
    stories = news_api.get_stories(page, {numericFilters: 'points>500'})
    @stories = []
    stories.each do |item|
      @stories << News.new(item["title"], item["url"], item["author"], item["points"], item["create_at"])
    end
  end
end
