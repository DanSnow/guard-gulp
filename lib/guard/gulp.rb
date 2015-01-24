require 'guard/compat/plugin'

require 'guard/gulp/options'
require 'guard/gulp/runner'

module Guard
  class Gulp < Plugin
    def initialize(options = {})
      super
      @options = Options.with_default(options)
      @runner = Runner.new(@options)
    end

    def start
      Guard::Compat::UI.notify "Guard::Gulp is running", title: "Gulp"
      Guard::Compat::UI.info "Guard::Gulp is running"
      run_all
    end

    def stop
    end

    def run_all
      @runner.run_all
    end

    def run_on_modifications(paths)
      run_all
    end
  end
end
