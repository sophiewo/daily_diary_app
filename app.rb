require "sinatra"

class DiaryApp < Sinatra::Base
  enable :sessions

get '/' do
  erb :index
end

get '/new-entry' do
  erb :new_entry
end

post '/added' do
  erb :added
end

run! if app_file == $0
end