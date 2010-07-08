require 'base64'

class AnyChartProxy
  
  def self.perform_request(env)
    req = Rack::Request.new(env)
    if req.post? && req.params['file'] && req.params['contentType']      
      headers = { 'Content-Type' => req.params['contentType'] }
      headers['Content-Disposition'] = "attachment; filename=\"#{req.params['fileName']}\"" if req.params['fileName']
      [200, headers, Base64.encode64(req.params['file'])]
    else
      [400, { 'Content-Type' => 'text/html'}, '']
    end
  end
  
  # For any Rack apps including Rails 3.*  
  def call(env)
    self.class.perform_request env
  end
end