module AssetFinder
  class Configuration
    attr_accessor :javascript_patterns
    attr_accessor :stylesheet_patterns
    attr_accessor :normalize_index_file

    DEFAULT = {
      javascript_patterns: [],
      stylesheet_patterns: [],
      normalize_index_file: true
    }.freeze

    def initialize(options = {})
      %i(javascript_patterns stylesheet_patterns normalize_index_file).each do |k|
        send(:"#{k}=", options[k] || DEFAULT[k])
      end
    end
  end
end
