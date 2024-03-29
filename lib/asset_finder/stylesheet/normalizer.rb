module AssetFinder
  module Stylesheet
    class Normalizer
      def initialize(root_dir:, path_pattern_collection:)
        @root_dir = root_dir.to_s
        @path_pattern_collection = path_pattern_collection

        freeze
      end

      def normalize(path)
        match = path_pattern_collection.match(path: path)
        return unless match

        match[1].sub(root_dir, '') + '.css'
      end

      private

      attr_reader :root_dir, :path_pattern_collection
    end
  end
end
