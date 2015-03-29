require 'minitest'
require 'minitest/mock'
require 'minitest/autorun'

require_relative '../lib/minitest/snail_plugin'

class SnailPluginTest < Minitest::Test
    
  def test_plugin_adds_snail_reporter_when_enabled
    initial_reporter = Minitest.reporter
    Minitest.reporter = Minitest::CompositeReporter.new
    
    options = {}
    Minitest::SnailReporter.enable!
    Minitest.plugin_snail_init(options)
    
    reporter_classes = Minitest.reporter.reporters.map(&:class)
    
    assert_equal [Minitest::SnailReporter], reporter_classes
  ensure
    Minitest.reporter = initial_reporter
  end
  
end

