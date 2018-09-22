class Request
  def self.log_this_request(env)
    request = "#{env['REMOTE_ADDR']} - - #{Time.now} #{env['REQUEST_METHOD']} #{env['REQUEST_URI']} #{env['SERVER_PROTOCOL']}"
    request = request + " #{env['HTTP_USER_AGENT']}" unless env['HTTP_USER_AGENT'].include? 'Intel'
    ManualLog.create(request: request)
  end
end
