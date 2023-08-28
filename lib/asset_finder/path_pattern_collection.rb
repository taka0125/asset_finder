module AssetFinder
  class PathPatternCollection
    def initialize(path_patterns:)
      @path_patterns = Array(path_patterns)

      freeze
    end

    def match?(path:)
      path_patterns.each do |path_pattern|
        return true if path_pattern.match?(path: path)
      end

      false
    end

    def match(path:)
      path_patterns.each do |path_pattern|
        match = path_pattern.match(path: path)
        return match if match
      end

      nil
    end

    private

    attr_reader :path_patterns
  end
end
