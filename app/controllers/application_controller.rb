require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "soup"
  end

  get "/" do
    erb :index
  end

  def self.current_user(session)
    User.find_by_id(session[:user_id])
  end

  def self.is_logged_in?(session)
    !!self.current_user(session)
  end

end
