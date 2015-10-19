require 'test/unit'
require 'fluent/log'
require 'fluent/test'

require 'fluent/plugin/out_terminal_notifier'
require 'fluent/plugin/filter_terminal_notifier'

module Fluent
  module TestUtil
    def osx?
      /darwin/ =~ RUBY_PLATFORM
    end
  end
end
