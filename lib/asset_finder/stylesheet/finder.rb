require 'find'

module AssetFinder
  module Stylesheet
    class Finder
      def self.execute
        [].tap do |paths|
          root_dir = File.join(Rails.root, 'app/assets/stylesheets/')
          normalizer = Normalizer.new(root_dir, AssetFinder.configuration.stylesheet_patterns)

          Find.find(root_dir).each do |path|
            normalized_path = normalizer.normalize(path)
            next if normalized_path.nil?
            paths << normalized_path
          end
        end
      end
    end
  end
end
