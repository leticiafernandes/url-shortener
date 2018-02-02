require 'sinatra'
require 'redis'
require 'securerandom'

class UrlShortener < Sinatra::Base
  redis = Redis.new

  get '/' do
    erb :index
  end

  post '/' do
    if not params[:url].empty? and validate_url(params[:url])
      @short_url = generate_token
      redis.setnx "url:#{@short_url}", params[:url]
      erb :index
    else 
      erb :error
    end
  end

  get '/:short_url' do
    @url = redis.get "url:#{params[:short_url]}"
    redirect @url || '/'
  end

  private 
    def generate_token
      SecureRandom.urlsafe_base64(6)
    end

    def validate_url(url)
      /^(http|https):\/\/.*$/.match(url)
    end
end
