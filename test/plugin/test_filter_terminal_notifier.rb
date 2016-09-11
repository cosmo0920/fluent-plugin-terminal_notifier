require 'helper'
require 'fluent/test/driver/filter'

class TerminalNotifierFilterTest < Test::Unit::TestCase
  include Fluent::TestUtil

  def setup
    Fluent::Test.setup
  end

  CONFIG = %[
    title filtered
    sub_title filter_test
    activate io.fluent-bit
  ]

  EMPTY_CONFIG = %[
  ]

  def create_driver(conf=CONFIG)
    Fluent::Test::Driver::Filter.new(Fluent::Plugin::TerminalNotifierFilter).configure(conf)
  end

  class TestConfigure < self
    def test_configure
      d = create_driver
      assert_equal "filtered", d.instance.title
      assert_equal "filter_test", d.instance.sub_title
      assert_equal "io.fluent-bit", d.instance.activate
    end

    def test_empty_configure
      assert_nothing_raised do
        create_driver EMPTY_CONFIG
      end
    end
  end

  def test_filter
    omit("This test needs OS X.") unless osx?

    d = create_driver CONFIG
    time = Time.parse('2013-02-12 22:01:15 UTC').to_i
    d.run(default_tag: 'io.fluent-bit') do
      d.feed(time, {"title" => "filtered title",
                    "sub_title" => "it's filtered sub.",
                    "message" => "This is one of the filtered test case"})
    end

    assert_true $?.success?
  end
end
