require 'rails_helper'

describe News do
  it "return creation time in dd/mm/YYYY" do
    news = News.new(
      "Brotli",
      "https://github.com/google/brotli",
      "raisedadead",
      2,
      "2016-01-20T19:27:47.000Z"
    )

    expect(news.created_at_f).to eq('20/01/2016')
  end
end
