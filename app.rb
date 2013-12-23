require 'bundler'
Bundler.setup :default
require 'sinatra'

# Set up Homepage
get '/' do
  erb :home
end