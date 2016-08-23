$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'bims_api_client'
require 'configuration'
require 'dotenv' #Check https://github.com/bkeepers/dotenv on a how-to with this gem, is very useful! :)

RSpec.configure do |config|
  Dotenv.load
  BimsApiClient.configure do |cfg|
    cfg.redis_url = ENV['BAC_REDIS_URL']
    cfg.username = ENV['BAC_USERNAME']
    cfg.password = ENV['BAC_PASSWORD']
    cfg.instance_name = ENV['BAC_INSTANCE_NAME']
    cfg.instance_url = ENV['BAC_INSTANCE_URL']
  end
end