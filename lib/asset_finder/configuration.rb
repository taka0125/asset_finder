module AssetFinder
  class Configuration
    attr_accessor :javascript_patterns
    attr_accessor :javascript_root_path
    attr_accessor :stylesheet_patterns
    attr_accessor :stylesheet_root_path
    attr_accessor :normalize_index_file

    DEFAULT = {
      javascript_patterns: [],
      javascript_root_path: 'app/assets/javascripts/',
      stylesheet_patterns: [],
      stylesheet_root_path: 'app/assets/stylesheets/',
      normalize_index_file: true
    }.freeze

    def initialize(options = {})
      DEFAULT.keys.each do |k|
        public_send(:"#{k}=", options[k] || DEFAULT[k])
      end
    end
  end
end
