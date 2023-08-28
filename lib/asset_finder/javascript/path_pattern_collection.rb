module AssetFinder
  module Javascript
    class PathPatternCollection < AssetFinder::PathPatternCollection
      DEFAULT_PATTERNS = [
        /^(.*)\.js\.coffee$/,
        /^(.*)\.coffee$/,
        /^(.*)\.js$/
      ].freeze

      def self.build
        patterns = AssetFinder.config.javascript_patterns + DEFAULT_PATTERNS
        new(path_patterns: patterns.map { |pattern| PathPattern.new(pattern: pattern) })
      end
    end
  end
end
