require 'rails_helper'

describe NewsAPI do
 # {"created_at"=>"2016-01-20T19:27:47.000Z",
 #   "title"=>"Brotli",
 #   "url"=>"https://github.com/google/brotli",
 #   "author"=>"raisedadead",
 #   "points"=>2,
 #   "story_text"=>nil,
 #   "comment_text"=>nil,
 #   "num_comments"=>0,
 #   "story_id"=>nil,
 #   "story_title"=>nil,
 #   "story_url"=>nil,
 #   "parent_id"=>nil,
 #   "created_at_i"=>1453318067,
 #   "_tags"=>["story", "author_raisedadead", "story_10940643"],
 #   "objectID"=>"10940643",
 #   "_highlightResult"=>
 #    {"title"=>{"value"=>"Brotli", "matchLevel"=>"none", "matchedWords"=>[]},
 #     "url"=>{"value"=>"https://<em>github</em>.com/google/brotli", "matchLevel"=>"full", "matchedWords"=>["github"]},
 #     "author"=>{"value"=>"raisedadead", "matchLevel"=>"none", "matchedWords"=>[]}}}

  it "get list of hack news stories match pre-defined criteria" do
    news_api = NewsAPI.new

    stories = news_api.get_stories
    expect(stories).to be_a(Array)

    stories.each do |story|
      expect(story["url"]).to match(/github/)
      expect(story["points"]).to be > 1000
    end
  end
end
