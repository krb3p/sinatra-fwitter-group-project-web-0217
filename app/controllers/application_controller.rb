require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/tweets/new' do

    erb :'/tweets/create_tweet'
  end

  post '/tweet' do
    binding.pry
    erb :'tweets/show_tweet'
  end

  # get '/tweet' do
  #   redirect
  # end



end
