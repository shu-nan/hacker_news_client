class NewsAPI
 # http://hn.algolia.com/api/v1/search_by_date?query=github&restrictSearchableAttributes=url&tags=story&points>1000
  BASE_URL = 'http://hn.algolia.com/api/v1/search_by_date'
  DEFAUL = {
    query: 'github', 
    restrictSearchableAttributes: 'url', 
    tags: 'story',
    numericFilters: 'points>1000', 
    hitsPerPage: 10, 
  }

  def initialize
  end

  def get_stories page_=1, options_={}
    uri = URI(BASE_URL)
    query = options_[:query] || DEFAUL[:query]
    searchables = options_[:restrictSearchableAttributes] || DEFAUL[:restrictSearchableAttributes]
    tags = options_[:tags] || DEFAUL[:tags]
    numberic_filters = options_[:numericFilters] || DEFAUL[:numericFilters]
    per_page = options_[:hitsPerPage] || DEFAUL[:hitsPerPage]
    params = { 
      query: query,
      restrictSearchableAttributes: searchables, 
      tags: tags,
      numericFilters: numberic_filters, 
      page: page_,
      hitsPerPage: per_page, 
    }
    uri.query = URI.encode_www_form(params)

    resp = Net::HTTP.get_response(uri)
    if resp.is_a?(Net::HTTPSuccess)
      resp_obj = JSON.parse(resp.body)
      return resp_obj
    else
      return {}
    end
  end

end
