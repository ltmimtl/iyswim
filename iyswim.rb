require 'sinatra'

set :haml, :format => :html5

get '/' do
  haml :home
end
