require 'find'

module AssetFinder
  module Javascript
    class PathCollector
      def initialize(root_dir:, path_pattern_collection:)
        @root_dir = root_dir || File.join(Rails.root, AssetFinder.config.javascript_root_path)
        @path_pattern_collection = path_pattern_collection || PathPatternCollection.build

        freeze
      end

      def execute
        [].tap do |paths|
          Find.find(root_dir).each do |path|
            next unless path_pattern_collection.match?(path: path)

            paths << path
          end
        end
      end

      private

      attr_reader :root_dir, :path_pattern_collection
    end
  end
end
