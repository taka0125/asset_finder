module AssetFinder
  module Javascript
    class Normalizer
      DEFAULT_PATTERNS = [
        /^(.*)\.js\.coffee$/,
        /^(.*)\.coffee$/,
        /^(.*)\.js$/
      ].freeze

      def initialize(root_dir, patterns = [])
        @root_dir = root_dir.to_s
        @patterns = patterns + DEFAULT_PATTERNS
      end

      def normalize(path)
        @patterns.each do |pattern|
          if path.match(pattern)
            return $1.sub(@root_dir, '') + '.js'
          end
        end
        nil
      end
    end
  end
end
