require 'minitest/autorun'
require 'minitest/benchmark'

require 'hex_values'

# This test is only useful to compare differents implementations of
#  the algorithm used to transformt floats to hex and vicecersa.
class BenchHexValues < MiniTest::Unit::TestCase
  def bench_float_to_hex
    assert_performance_linear 0.9999 do |n|
      n.times do
        (98789879890.87).to_hex #O(1)
      end
    end
  end

  def bench_integer_to_hex
    assert_performance_linear 0.999 do |n|
      n.times do
        9878987608.to_hex #O(1)
      end
    end
  end

  def bench_hex_to_float
    assert_performance_linear 0.9999 do |n|
      n.times do
        "5f2f9e39.42".to_float #O(1)
      end
    end
  end
end
