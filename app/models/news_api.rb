class NewsAPI
 # http://hn.algolia.com/api/v1/search_by_date?query=github&restrictSearchableAttributes=url&tags=story&points>1000
  BASE_URL = 'http://hn.algolia.com/api/v1/search_by_date'
  DEFAUL = {
    query: 'github', 
    restrictSearchableAttributes: 'url', 
    tags: 'story',
    numericFilters: 'points>1000', 
  }

  def initialize
  end

  def get_stories options_={}
    stories = []
    uri = URI(BASE_URL)
    query = options_[:query] || DEFAUL[:query]
    searchables = options_[:restrictSearchableAttributes] || DEFAUL[:restrictSearchableAttributes]
    tags = options_[:tags] || DEFAUL[:tags]
    numberic_filters = options_[:numericFilters] || DEFAUL[:numericFilters]
    page = options_[:page] || 1
    params = { 
      query: query,
      restrictSearchableAttributes: searchables, 
      tags: tags,
      numericFilters: 'points>1000', 
      page: page
    }
    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)
    if res.is_a?(Net::HTTPSuccess)
      stories = JSON.parse(res.body)
    end
    stories
  end

end
