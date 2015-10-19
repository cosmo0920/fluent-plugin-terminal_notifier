require 'terminal-notifier'

module Fluent
  module NotifyUtil
    def notify(time, record)
      message = record["message"] || "#{record.to_json} at #{Time.at(time).localtime}"
      options = make_option(record)
      TerminalNotifier.notify(message, options)
    end

    def make_option(record)
      title = record["title"] || @title
      sub_title = record["sub_title"] || @sub_title
      options = {title: title, subtitle: sub_title}
      unless @activate.empty?
        options.merge!(activate: @activate)
      end
      options
    end
  end
end
