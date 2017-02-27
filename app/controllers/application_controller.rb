require './config/environment'

class ApplicationController < Sinatra::Base
  # set :views, Proc.new { File.join(root, "../views/") }


  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "password_security"
  end

  get '/' do
    erb :homepage
  end

  get '/signup' do
    if Helpers.is_logged_in?(session)
      redirect '/tweets'
    else
    erb :'/users/create_user'
    end
  end

  post '/signup' do
      if !params.values.any? {|v| v.empty?}
        @user = User.create(params)
        session[:id] = @user.id
        redirect '/tweets'
      else
        redirect '/signup'
      end
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

  get '/tweets/new' do
    if session[:id]
      erb :'/tweets/create_tweet'
    else
      redirect to '/login'
    end
  end

  post '/tweets' do
    if !params[:content].empty?
      @tweet = Tweet.create(content: params[:content])
      @tweet.user = User.find(session[:id])
      @tweet.save
      erb :'tweets/show_tweet'
    else
      redirect to '/tweets/new'
    end
  end

  get '/tweet' do
    redirect
  end

  get '/tweets' do
    if session[:id]
      @user = User.find(session[:id])
      erb :'tweets/tweets'
    else
      redirect '/users/login'
    end
  end

  get '/tweets/:id' do
    if session[:id]
      @tweet = Tweet.find(params[:id])
      erb :'/tweets/show_tweet'
    else
      redirect to '/login'
    end
  end

  get '/tweets/:id/edit' do
    if session[:id]
      @tweet = Tweet.find(params[:id])
      erb :'/tweets/edit_tweet'
    else
      redirect to '/login'
    end
  end

  patch '/tweets/:id' do
    if !params[:content].empty?
      Tweet.update(params[:id], content: params[:content])
    else
      redirect to "/tweets/#{params[:id]}/edit"
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])

    erb :'users/show'
  end

  get '/logout' do
    session.clear
    redirect '/user/login'
  end


end
