require 'open3'
require 'guard/gulp/formatter'

module Guard
  class Gulp < Plugin
    class Runner
      def initialize(options)
        @options = options
      end

      def run_all
        `gulp --no-color #{@options[:task]}`
      end
    end
  end
end
