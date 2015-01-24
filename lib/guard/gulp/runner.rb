require 'open3'
require 'guard/gulp/formatter'

module Guard
  class Gulp < Plugin
    class Runner
      def initialize(options)
        @options = options
      end

      def run_all
        output, _ = Open3.capture2e("gulp --no-color #{@options[:task]}")
        result = Formatter.new(output)
        if result.fail_tasks.empty?
          Compat::UI.notify("#{@options[:task]} done", title: "Gulp")
          Compat::UI.info("#{@options[:task]} done")
        else
          result.fail_tasks.each {|task_name|
            Compat::UI.notify("#{task_name} fail", title: "Gulp")
            Compat::UI.error("#{task_name} fail")
          }
          Compat::UI.error("Backtrace:")
          Compat::UI.error(result.backtrace)
        end
      end
    end
  end
end
