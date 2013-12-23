require 'bundler'
Bundler.setup :default
require 'sinatra'

helpers do
  # If @title is assigned, add it to the page's title.
  def title
    if @title
      "#{@title}"
    else
      "No title"
    end
  end
end

# Set up Homepage
get '/' do
  require 'open-uri'
  require 'xmlsimple'
  erb :"pages/home"
end