module AssetFinder
  module Javascript
    class Normalizer
      def initialize(root_dir:, path_pattern_collection:, normalize_index_file: true)
        @root_dir = root_dir.to_s
        @path_pattern_collection = path_pattern_collection
        @normalize_index_file = normalize_index_file

        freeze
      end

      def normalize(path)
        match = path_pattern_collection.match(path: path)
        return unless match

        normalized_path = match[1].delete_prefix(root_dir)
        normalized_path = normalized_path.delete_suffix('/index') if normalize_index_file
        normalized_path + '.js'
      end

      private

      attr_reader :root_dir, :path_pattern_collection, :normalize_index_file
    end
  end
end
