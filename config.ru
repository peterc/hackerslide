require 'rubygems'
require 'sinatra'
require 'app'

set :environment, :development
set :root, File.dirname(__FILE__)

run Sinatra::Application