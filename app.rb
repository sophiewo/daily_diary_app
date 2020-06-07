require "sinatra"
require './lib/entry'

class DiaryApp < Sinatra::Base
  enable :sessions

get '/' do
  erb :index
end

get '/new-entry' do
  erb :new_entry
end

post '/new-entry/add' do
  Entry.add(title: params[:title])
  redirect '/added'
end

get '/added' do
  @last = Entry.last_entry
  erb :added
end

run! if app_file == $0
end