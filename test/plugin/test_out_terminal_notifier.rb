require 'helper'

class TerminalNotifierOutputTest < Test::Unit::TestCase
  def setup
    Fluent::Test.setup
  end

  CONFIG = %[
    title test
    sub_title sub_test
    activate org.fluentd
  ]

  def create_driver(conf=CONFIG, tag='test')
    Fluent::Test::OutputTestDriver.new(Fluent::TerminalNotifierOutput, tag).configure(conf)
  end

  def test_configre
    d = create_driver
    assert_equal "test", d.instance.title
    assert_equal "sub_test", d.instance.sub_title
    assert_equal "org.fluentd", d.instance.activate
  end

  def osx?
    /darwin/ =~ RUBY_PLATFORM
  end

  def test_emit
    omit("This test needs OS X.") unless osx?

    d = create_driver
    time = Time.parse('2013-02-12 22:01:15 UTC').to_i
    d.run do
      d.emit({"title" => "test title",
              "subtitle" => "it's sub.",
              "message" => "This is one of the test case"})
    end

    assert_true $?.success?
  end
end
