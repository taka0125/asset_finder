require 'find'

module AssetFinder
  module Javascript
    class Finder
      def self.execute
        [].tap do |paths|
          root_dir = File.join(Rails.root, 'app/assets/javascripts/')
          norimalizer = Normalizer.new(root_dir)

          Find.find(root_dir).each do |path|
            norimalized_path = norimalizer.norimalize(path)
            next if norimalized_path.nil?
            paths << path
          end
        end
      end
    end
  end
end
