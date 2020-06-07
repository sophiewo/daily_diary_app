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
  Entry.add(title: params[:title], body: params[:body])
  redirect '/added'
end

get '/added' do
  erb :added
end

get '/show-all' do
  @diary = Entry.all
  p @diary
  erb :show_all
end

run! if app_file == $0
end