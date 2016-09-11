require 'helper'
require 'fluent/test/driver/output'

class TerminalNotifierOutputTest < Test::Unit::TestCase
  include Fluent::TestUtil

  def setup
    Fluent::Test.setup
  end

  CONFIG = %[
    title test
    sub_title sub_test
    activate org.fluentd
  ]

  EMPTY_CONFIG = %[
  ]

  def create_driver(conf=CONFIG)
    Fluent::Test::Driver::Output.new(Fluent::Plugin::TerminalNotifierOutput).configure(conf)
  end

  class TestConfigure < self
    def test_configure
      d = create_driver
      assert_equal "test", d.instance.title
      assert_equal "sub_test", d.instance.sub_title
      assert_equal "org.fluentd", d.instance.activate
    end

    def test_empty_configure
      assert_nothing_raised do
        create_driver EMPTY_CONFIG
      end
    end
  end

  data("all included" => [{"title" => "test title",
                           "sub_title" => "it's sub.",
                           "message" => "This is one of the test case"}, CONFIG],
       "lack of sub title" => [{"title" => "test title",
                                "message" => "This is one of the test case"},
                               EMPTY_CONFIG],
       "lack of sub title & title" => [{"message" => "This is one of the test case"},
                                       EMPTY_CONFIG],
       "all default" => [{"value" => "This is one of the test case"},
                         EMPTY_CONFIG],

      )
  def test_process(data)
    omit("This test needs OS X.") unless osx?
    target, config = data
    d = create_driver config
    time = Time.parse('2013-02-12 22:01:15 UTC').to_i
    d.run(default_tag: 'test') do
      d.feed(time, target)
    end

    assert_true $?.success?
  end
end
