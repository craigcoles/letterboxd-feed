require 'bundler'
Bundler.setup :default
require 'sinatra'
require 'sprockets'
require 'xmlsimple'
require 'net/http'

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
  http = Net::HTTP.new('letterboxd.com')
  response = http.request(Net::HTTP::Get.new("/craigcoles/rss/"))
  @response_status = XmlSimple.xml_in(response.body, { 'ForceArray' => false })
  erb :"pages/home"
end
