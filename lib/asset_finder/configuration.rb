module AssetFinder
  class Configuration
    attr_accessor :javascript_patterns, :stylesheet_patterns

    DEFAULT = {
      javascript_patterns: [],
      stylesheet_patterns: []
    }.freeze

    def initialize(options = {})
      %i(javascript_patterns stylesheet_patterns).each do |k|
        send(:"#{k}=", options[k] || DEFAULT[k])
      end
    end
  end
end
