require 'spec_helper'
include BimsApiClient

describe BimsApiClient do

  it 'Initialize the BIMS API client' do
    expect(BimsApiClient.init).to eq(true)
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
