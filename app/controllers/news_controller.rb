class NewsController < ApplicationController

  def index
    page = params[:page].blank? ? 1 : params[:page].to_i
    news_api = NewsAPI.new
    # Allow change parameter from url
    options = {}
    %i[query restrictSearchableAttributes tags numericFilters hitsPerPage].each do |key|
      options[key] = params[key]
    end
    stories = news_api.get_stories(page, options)
    @stories = []
    if stories["hits"]
      stories["hits"].each do |item|
        @stories << News.new(item["title"], item["url"], item["author"], item["points"], item["created_at"])
      end
    end

   @num_of_pages = stories["nbPages"].to_i
   @page = stories["page"].to_i
    
  end
end
