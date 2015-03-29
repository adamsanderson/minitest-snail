module Minitest
  class SnailReporter < Reporter
    attr_reader :slow_tests, :max_duration
    
    def self.options
      @default_options ||= {
        :max_duration => 2
      }
    end
    
    def self.enable!(options = {})
      @enabled = true
      self.options.merge!(options)
    end

    def self.enabled?
      @enabled ||= false
    end
    
    def initialize(io = STDOUT, options = self.class.options)
      super
      
      @max_duration = options.fetch(:max_duration)
      @slow_tests = []
    end
    
    def record result
      slow_tests << result if result.time > max_duration
    end
    
    def report
      return if slow_tests.empty?
      
      slow_tests.sort_by!{|r| -r.time}
      
      io.puts
      io.puts "#{slow_tests.length} slow tests."
      slow_tests.each_with_index do |result, i|
        io.puts "%3d) %s: %.2f s" % [i+1, result.location, result.time]
      end
    end
    
  end
end