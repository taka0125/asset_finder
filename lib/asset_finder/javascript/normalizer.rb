module AssetFinder
  module Javascript
    class Normalizer
      DEFAULT_PATTERNS = [
        /^(.*)\.js\.coffee$/,
        /^(.*)\.coffee$/,
        /^(.*)\.js$/
      ].freeze

      def initialize(root_dir, patterns = [], normalize_index_file: true)
        @root_dir = root_dir.to_s
        @patterns = patterns + DEFAULT_PATTERNS
        @normalize_index_file = normalize_index_file
      end

      def normalize(path)
        @patterns.each do |pattern|
          if path.match(pattern)
            normalized_path = $1.delete_prefix(@root_dir)
            normalized_path = normalized_path.delete_suffix('/index') if @normalize_index_file
            return normalized_path + '.js'
          end
        end
        nil
      end
    end
  end
end
