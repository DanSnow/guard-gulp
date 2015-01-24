module Guard
  class Gulp < Plugin
    module Options
      Default = {
        task: :default
      }
      def self.with_default(options)
        Default.merge(options)
      end
    end
  end
end
