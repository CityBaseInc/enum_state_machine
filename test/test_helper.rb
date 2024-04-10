if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start { add_filter '/test/' }
end

#require 'test/unit'
require 'minitest'
require "minitest/autorun"
require 'enum_state_machine'

# The upstream repo capitalizes the "T" in "MiniTest".
# This results in a the following error when running the tests:
#
#   uninitialized constant MiniTest (NameError)
#
# Rather than renaming throughout, we add an alias to Minitest
MiniTest = Minitest

class MiniTest::Test
  def assert_nothing_raised
    yield
  rescue => ex
    assert_nil ex
  end

  alias_method :assert_nothing_thrown, :assert_nothing_raised
end
