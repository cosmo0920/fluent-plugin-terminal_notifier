require 'fluent/plugin/output'
require_relative './notify_util'

module Fluent::Plugin
  class TerminalNotifierOutput < Output
    include Fluent::NotifyUtil

    Fluent::Plugin.register_output('terminal_notifier', self);

    DEFAULT_TITLE             = "Fluentd Notification"
    DEFAULT_SUB_TITLE         = "Fluentd Notification Sub Title"

    config_param :title, :string, default: DEFAULT_TITLE
    config_param :sub_title, :string, default: DEFAULT_SUB_TITLE
    config_param :activate, :string, default: ""

    def configure(conf)
      super
    end

    def multi_workers_ready?
      true
    end

    def process(tag, es)
      es.each{|time,record|
        notify(time, record)
      }
    end
  end
end
