require 'minitest'
require 'minitest/autorun'

require_relative '../lib/minitest/snail_reporter'

class SnailReporterTest < Minitest::Test
  attr_reader :reporter
  attr_reader :result
  attr_reader :io
  
  def setup
    @io       = StringIO.new
    @reporter = Minitest::SnailReporter.new(@io)
    @result   = Minitest::Test.new "sample"
  end
  
  def test_slow_test_cases_are_recorded
    result.time = reporter.max_duration + 1
    
    reporter.record result
    
    assert_equal [result], reporter.slow_tests
  end
  
  def test_fast_test_cases_are_not_recorded
    result.time = 0
    
    reporter.record result
    
    assert reporter.slow_tests.empty?
  end
  
  def test_reports_on_slow_tests
    result.time = 3
    reporter.slow_tests << result
    
    reporter.report
    
    assert_includes io.string, result.location
    assert_includes io.string, "3.00 s"
  end
  
  def test_max_duration_is_configurable
    expected_duration = 3.14
    @reporter = Minitest::SnailReporter.new(@io, max_duration: expected_duration)
    
    assert_equal expected_duration, @reporter.max_duration
  end
  
end

