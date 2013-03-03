module Httpbench
  class Site
    attr_accessor :host, :port, :address

    def initialize(opts = {})
      @host = opts[:host]
      @port = opts[:port]
      @address = opts[:address]
    end

    def new_page(opts = {})
      Page.new(self, opts)
    end

    def client
      Client.new(@address, @port)
    end
  end
end
