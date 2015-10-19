module Fluent
  class TerminalNotifierOutput < Output
    require_relative './notify_util'
    include NotifyUtil

    Plugin.register_output('terminal-notifier', self);

    DEFAULT_TITLE             = "Fluentd Notification"
    DEFAULT_SUB_TITLE         = "Fluentd Notification Sub Title"

    config_param :title, :string, default: DEFAULT_TITLE
    config_param :sub_title, :string, default: DEFAULT_SUB_TITLE
    config_param :activate, :string, default: ""

    def configure(conf)
      super
    end

    def emit(tag, es, chain)
      es.each{|time,record|
        notify(time, record)
      }
      chain.next
    end
  end
end
