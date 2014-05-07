require 'rubygems'
require 'bundler/setup'
require_relative 'app'
require 'rantly/minitest_extensions'
require 'minitest/autorun'

class MyTest < Minitest::Test
  def test_its_an_integer
    property_of { Math.add(integer, integer) }.check { |i| assert i.is_a?(Integer) }
  end

  def test_higher_when_positive
    property_of {
      x = integer
      y = integer
      guard x > 0
      guard y > 0

      result = Math.add(x, y)
      {result: result, x: x, y: y}
    }
      .check { |hash|
        assert hash[:result] > hash[:x]
        assert hash[:result] > hash[:y]
      }
  end

  def test lower_when_negative
    property_of {
      x = integer
      y = integer
      guard x < 0
      guard y < 0

      result = Math.add(x, y)
      {result: result, x: x, y: y}
    }
      .check { |hash|
        assert hash[:result] < hash[:x]
        assert hash[:result] < hash[:y]
      }
  end
end
