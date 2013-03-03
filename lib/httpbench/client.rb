require 'net/http'

module Httpbench
  class Client
    attr_accessor :host, :port

    def initialize(host, port)
      @host = host
      @port = port
    end

    def connection
      Net::HTTP.new(host, port)
    end

    def request(path, method = :get)
      Net::HTTP.const_get(method.capitalize).new(path)
    end
  end
end
