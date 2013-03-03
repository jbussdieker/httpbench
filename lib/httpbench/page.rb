module Httpbench
  class Page
    def initialize(site, path)
      @site = site
      @path = path
    end

    # Issue a request to the page
    def request
      started = Time.now
      client = @site.client
      request = client.request(@path)
      request["Host"] = @site.host
      connection = client.connection
      response = connection.request(request)
      {
        :duration => Time.new - started,
        :connection => connection,
        :request => request,
        :response => response
      }
    end
  end
end