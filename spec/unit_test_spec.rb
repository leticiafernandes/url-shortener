require File.expand_path '../spec_helper.rb', __FILE__
require 'fakeredis'

describe "UrlShortener unit tests" do

  it "does request with token in redis matches url" do
  	redis = Redis.new
  	url = "https://en.wikipedia.org/wiki/Germany"
  	@short_url = "token123"
    redis.setnx "url:#{@short_url}", url
    
    sleep 1

    get_url = redis.get "url:token123"
    expect(get_url).to eq url
  end
end
