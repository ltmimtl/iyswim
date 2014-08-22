require 'sinatra'
require 'haml'
require 'coffee_script'
require 'sass'

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
  sass "../public/styles/#{filename}".to_sym
end
