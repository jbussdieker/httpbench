module Httpbench
  class Test
    attr_accessor :duration, :rps

    # Options:
    #   duration: Total time to run test for
    #   rps: Target requests/sec for test
    def initialize(opts = {})
      @duration = opts[:duration] || 60
      @rps = opts[:rps] || 1
      @threads = []
    end

    # Run the test
    def run(page)
      started = Time.now
      requests = 0
      while (elapsed = Time.now - started) < duration
        if (avg_rps = requests / elapsed) < rps
          requests += 1
          @threads << Thread.new do
            page.request
          end
        end
      end
      ended = Time.now
    end

    def results
      @threads.collect {|t| t.value}
    end
  end
end
