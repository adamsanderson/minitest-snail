require_relative './snail_reporter'

module Minitest
  def self.plugin_snail_options(opts, options)
    opts.on "--max-duration TIME", "Report tests that take longer than TIME seconds." do |max_duration|
      SnailReporter.enable! :max_duration => max_duration.to_f
    end
  end

  def self.plugin_snail_init(options)
    if SnailReporter.enabled?
      io = options[:io]
      Minitest.reporter.reporters << SnailReporter.new(io)
    end
  end
  
end