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
    erb :'tweets/tweets'
  end
  # get '/homepage'

end
