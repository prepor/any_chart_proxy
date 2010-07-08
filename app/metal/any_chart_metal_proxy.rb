require 'any_chart_proxy'

class AnyChartMetalProxy
  def self.call(env)
    if env["PATH_INFO"] =~ /^\/any_chart_proxy/
      status, headers, data = AnyChartProxy.perform_request env
      [status, headers, [data]]
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end  
end