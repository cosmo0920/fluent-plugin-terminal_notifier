module Fluent
  class TerminalNotifierOutput < Output
    Plugin.register_output('terminal-notifier', self);

    DEFAULT_TITLE             = "Fluentd Notification"
    DEFAULT_SUB_TITLE         = "Fluentd Notification Sub Title"

    config_param :title, :string, default: DEFAULT_TITLE
    config_param :sub_title, :string, default: DEFAULT_SUB_TITLE
    config_param :activate, :string, default: ""

    def initialize
      super

      require 'terminal-notifier'
    end

    def configure(conf)
      super
    end

    def emit(tag, es, chain)
      es.each{|time,record|
        message = record["message"] || "#{record.to_json} at #{Time.at(time).localtime}"
        options = make_option(record)
        TerminalNotifier.notify(message, options)
      }
      chain.next
    end

    def make_option(record)
      title = record["title"] || @title
      sub_title = record["sub_title"] || @sub_title
      options = {title: title, subtitle: sub_title}
      unless activate.empty?
        options.merge!(activate: activate)
      end
      options
    end
  end
end
