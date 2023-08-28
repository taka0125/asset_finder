module AssetFinder
  class SprocketsConfigGenerator
    def initialize
      freeze
    end

    def execute
      Javascript::SprocketsConfigGenerator.new.execute + Stylesheet::SprocketsConfigGenerator.new.execute
    end
  end
end
