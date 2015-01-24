module Guard
  class Gulp < Plugin
    class Formatter
      attr_reader :fail_tasks, :backtrace
      def initialize(raw_output)
        @output = raw_output
        @fail_tasks = []
        @backtrace = nil
        parse
      end

      private
      GulpOutput = %r(\[\d+:\d+:\d+\]\s.*)
      StartTask = %r(\[\d+:\d+:\d+\]\sStarting\s'(\w+)'.*)
      FinishTask = %r(\[\d+:\d+:\d+\]\sFinished\s'(\w+)'.*)
      def parse
        tasks = []
        backtrace = []
        @output.each_line { |line|
          if m = line.match(StartTask)
            tasks << m[1]
          elsif m = line.match(FinishTask)
            tasks.delete(m[1])
          elsif !(m = line.match(GulpOutput))
            backtrace << line
          end
        }
        unless tasks.empty?
          @fail_tasks += tasks
          @backtrace = backtrace.join("\n")
        end
      end
    end
  end
end
