require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "password_security"
  end

  get '/' do
    erb :index
  end

  get '/tweets/new' do
    erb :'/tweets/create_tweet'
  end

  post '/tweets' do
        # binding.pry
    @tweet = Tweet.create(content: params[:tweet][:content])
    @tweet.user = User.find(session[:id])
    erb :'tweets/show_tweet'
  end

  # get '/tweet' do
  #   redirect
  # end

  get '/tweets' do
    erb :'tweets/tweets'
  end



end
