module AssetFinder
  class PathPattern
    attr_reader :pattern

    def initialize(pattern:)
      @pattern = pattern

      freeze
    end

    def match?(path:)
      path.match?(pattern)
    end

    def match(path:)
      path.match(pattern)
    end
  end
end
