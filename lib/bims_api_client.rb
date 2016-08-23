require 'bims_api_client/version'
require 'redis'
require 'httparty'
require 'configuration'

module BimsApiClient
  include HTTParty

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  default_timeout 320 # hard timeout after 1 second

  def init
    success = false
    begin
      success = setup_redis(@configuration.redis_url) && set_api_base_uri(@configuration.instance_url)
    rescue => e #debug the error
      puts e.to_s
    end
    return success
  end

  def not_initialized?
    !@configuration.instance_url && !@configuration.instance_name
  end

  def setup_redis(redis_url)
    @redis = Redis.new(url: redis_url)
  end

  def set_api_base_uri(uri)
    success = false
    begin
      base_uri uri
      success = true
    rescue => e
      puts e.to_s #debug the error
    end
    return success
  end

  def set_error_object(data = nil)
    {status: 'error', code: -1, data: data}
  end

  def session_active?
    (@redis.get('bims_sid') && !@redis.get('bims_sid').empty?) ? true : false
  end

  def login(username = (@configuration.username), password = (@configuration.password))
    success = false
    begin
      return false if not_initialized?
      response_object = _login(username, password)
      if response_object[@configuration.status_key] == @configuration.status_value_ok
        @redis.set('bims_sid', response_object[@configuration.data_key][@configuration.data_session_key][@configuration.data_session_id_key].to_s)
        success = true
      end
    rescue => e
      puts e.to_s #debug the error
    end
    return success
  end

  def logout
    begin
      return false if not_initialized?
      sid = @redis.get('bims_sid')
      @redis.set('bims_sid', nil)
      response_object = _logout(sid)
      response_object[@configuration.status_key] == @configuration.status_value_ok ? true : false
    rescue => e
      puts e.to_s #debug the error
    end
  end

  private
  #Call to the BIMS API "login" method and gets the whole response body
  def _login(username, password)
    begin
      return set_error_object({message: @configuration.not_initialized_message}) if not_initialized?
      url = "#{base_uri}/#{@configuration.users_path}/login.#{@configuration.api_request_format}"
      response = post url, body: {user: username, password: Digest::MD5.hexdigest(password)}
      JSON.parse (response.body && !response.body.empty?) ? response.body : set_error_object #returns the complete object
    rescue => e
      puts e.to_s #debug the error
    end
  end

  #Call to the BIMS API "logout" method and gets the whole response body
  def _logout(sid)
    begin
      return set_error_object({message: @configuration.not_initialized_message}) if not_initialized?
      url = "#{base_uri}/#{@configuration.users_path}/logout.#{@configuration.api_request_format}"
      response = post url, body: {sid: sid}
      JSON.parse (response.body && !response.body.empty?) ? response.body : set_error_object #returns the complete object
    rescue => e
      puts e.to_s #debug the error
    end
  end

  #Call to the BIMS API "sales_add" method and gets the whole response body
  def _sales_add(sale_data)
    begin
      return set_error_object({message: @configuration.not_initialized_message}) if not_initialized?
      url = "#{base_uri}/#{@configuration.sales_path}/add.#{@configuration.api_request_format}"
      response = post url, body: {data: sale_data}
      JSON.parse (response.body && !response.body.empty?) ? response.body : set_error_object #returns the complete object
    rescue => e
      puts e.to_s #debug the error
    end
  end

end
