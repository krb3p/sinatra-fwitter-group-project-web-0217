require './config/environment'

class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

<<<<<<< HEAD
  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    erb :'tweets/tweets'
  end
  # get '/homepage'
=======
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


>>>>>>> bd362e0f5828822fa8dbaa7da34c10fd7f11832d

end
