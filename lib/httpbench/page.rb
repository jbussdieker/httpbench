module Httpbench
  class Page
    def initialize(site, opts = {})
      @site = site
      @path = opts[:path]
    end

    # Issue a request to the page
    def request
      started = Time.now
      client = @site.client
      request = client.request(@path)
      request["Host"] = @site.host
      connection = client.connection
      response = connection.request(request)
      ended = Time.now
      {
        :started => started,
        :ended => ended,
        :duration => ended - started,
        :connection => connection,
        :request => request,
        :response => response
      }
    end
  end
end
