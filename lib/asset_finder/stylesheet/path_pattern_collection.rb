module AssetFinder
  module Stylesheet
    class PathPatternCollection < AssetFinder::PathPatternCollection
      DEFAULT_PATTERNS = [
        /^(.*)\.css\.scss$/,
        /^(.*)\.css$/,
        /^(.*)\.scss$/
      ].freeze

      def self.build
        patterns = AssetFinder.config.stylesheet_patterns + DEFAULT_PATTERNS
        new(path_patterns: patterns.map { |pattern| PathPattern.new(pattern: pattern) })
      end
    end
  end
end
