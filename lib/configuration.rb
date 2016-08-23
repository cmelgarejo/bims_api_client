module BimsApiClient
  class Configuration
    attr_accessor :not_initialized_message, :api_request_format, :users_path, :contacts_path, :sales_path, :status_key,
                  :status_value_ok, :status_value_error, :code_key, :data_key, :data_session_key, :data_session_id_key,
                  :redis_url, :username, :password, :instance_name, :instance_url

    def initialize
      @not_initialized_message = 'Client not initialized'
      @api_request_format = 'json'
      @users_path = 'users'
      @contacts_path = 'contacts'
      @sales_path = 'sales'
      @status_key = 'status'
      @status_value_ok = 'ok'
      @status_value_error = 'error'
      @code_key = 'code'
      @data_key = 'data'
      @data_session_key = 'Session'
      @data_session_id_key = 'id'
      @redis_url = 'redis://127.0.0.1:6379'
      @username = nil
      @password = nil
      @instance_name = nil
      @instance_url = nil
    end
  end
end