require 'any_chart_proxy'

class AnyChartMetalProxy
  def self.call(env)
    if env["PATH_INFO"] =~ /^\/any_chart_proxy/
      AnyChartProxy.perform_request env
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end  
end