require './config/environment'

class ApplicationController < Sinatra::Base
  # set :views, Proc.new { File.join(root, "../views/") }


  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "password_security"
  end

  get '/login' do
    if session[:id]
      redirect to '/tweets'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    session[:id] = @user.id
    redirect to '/tweets'
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

  get '/tweets' do
    @user = User.find(session[:id])
    erb :'tweets/tweets'
  end


end
