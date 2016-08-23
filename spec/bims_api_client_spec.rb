require 'spec_helper'
include BimsApiClient

describe BimsApiClient do

  it 'Initialize the BIMS API client' do
    require 'dotenv' #Check https://github.com/bkeepers/dotenv on a how-to with this gem, is very useful! :)
    Dotenv.load
    BimsApiClient.configure do |cfg|
      cfg.redis_url = ENV['BAC_REDIS_URL']
      cfg.username = ENV['BAC_USERNAME']
      cfg.password = ENV['BAC_PASSWORD']
      cfg.instance_name = ENV['BAC_INSTANCE_NAME']
      cfg.instance_url = ENV['BAC_INSTANCE_URL']
    end
    expect(BimsApiClient.start).to eq(true)
  end

  it 'Login to the BIMS platform' do
    expect(BimsApiClient.login).to eq(true)
  end

  it 'API client has an active session' do
    expect(BimsApiClient.session_active?).to eq(true)
  end

  it 'Logout from the BIMS platform' do
    expect(BimsApiClient.logout).to eq(true)
  end

  it 'API client does not have active session' do
    expect(BimsApiClient.session_active?).to eq(false)
  end

end
