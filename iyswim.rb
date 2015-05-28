require 'bundler'
Bundler.require
require 'sinatra'
require 'tilt/haml'
require 'tilt/coffee'
require 'tilt/sass'

set :haml, format: :html5, layout: :layout

get '/' do
  haml :home
end

# assets
get '/javascripts/*.js' do
  filename = params[:splat].first
  coffee "../public/javascripts/#{filename}".to_sym
end

get '/styles/*.css' do
  filename = params[:splat].first
  scss "../public/styles/#{filename}".to_sym
end
