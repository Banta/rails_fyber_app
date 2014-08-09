$: << File.join(File.dirname(__FILE__), '..', 'lib')
require 'pry' if ENV['APP_ENV'] == 'debug' # add `binding.pry` wherever you need to debug
require File.expand_path("../../config/environment", __FILE__)
require 'fiber_offer_api'
