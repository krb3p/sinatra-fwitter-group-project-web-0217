require './config/environment'

class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    binding.pry
    riderect to '/tweets/tweets'
  end
  # get '/homepage'
  get '/' do
    erb :index
  end

  get '/tweet/new' do
    erb :'/tweets/create_tweet'
  end

  post '/tweet' do
    erb :'tweets/show_tweet'
  end

  get '/tweet' do
    redirect
  end


end
