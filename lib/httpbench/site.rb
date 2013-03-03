module Httpbench
  class Site
    attr_accessor :host, :port, :address

    def initialize(opts = {})
      @host = opts[:host]
      @port = opts[:port]
      @address = opts[:address]
    end

    def new_page(path)
      Page.new(self, path)
    end

    def client
      Client.new(@address, @port)
    end
  end
end
