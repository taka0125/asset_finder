require 'find'

module AssetFinder
  module Stylesheet
    class DartsassConfigGenerator
      def initialize(root_dir: nil)
        @root_dir = root_dir || File.join(Rails.root, 'app/assets/stylesheets/')
        @path_pattern_collection = PathPatternCollection.build
        @path_collector = PathCollector.new(root_dir: @root_dir, path_pattern_collection: @path_pattern_collection)
        @normalizer = Normalizer.new(root_dir: @root_dir, path_pattern_collection: @path_pattern_collection)

        freeze
      end

      def execute
        {}.tap do |results|
          path_collector.execute.each do |path|
            key = path.delete_prefix(root_dir)
            value = normalizer.normalize(path)

            results[key] = value
          end
        end
      end

      private

      attr_reader :root_dir, :path_pattern_collection, :path_collector, :normalizer
    end
  end
end
