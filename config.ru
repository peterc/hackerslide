require 'rubygems'
require 'sinatra'
require 'app'

APP_ROOT = File.expand_path(File.dirname(__FILE__))

set :environment, :development
set :root, APP_ROOT
set :data_root, APP_ROOT + '/public/data'

run Sinatra::Application