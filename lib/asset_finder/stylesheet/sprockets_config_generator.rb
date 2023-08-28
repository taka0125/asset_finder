require 'find'

module AssetFinder
  module Stylesheet
    class SprocketsConfigGenerator
      def initialize(root_dir: nil)
        @root_dir = root_dir || File.join(Rails.root, 'app/assets/stylesheets/')
        @path_pattern_collection = PathPatternCollection.build
        @path_collector = PathCollector.new(root_dir: @root_dir, path_pattern_collection: @path_pattern_collection)
        @normalizer = Normalizer.new(root_dir: @root_dir, path_pattern_collection: @path_pattern_collection)

        freeze
      end

      def execute
        path_collector.execute.map { |path| normalizer.normalize(path) }.compact
      end

      private

      attr_reader :root_dir, :path_pattern_collection, :path_collector, :normalizer
    end
  end
end
