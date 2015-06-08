module AssetFinder
  module Javascript
    class Normalizer
      def initialize(root_dir)
        @root_dir = root_dir.to_s
      end

      def norimalize(path)
        if path.match(/^(.*)\.js\.coffee$/)
          return $1.sub(@root_dir, '') + '.js'
        end

        if path.match(/^(.*)\.coffee$/)
          return $1.sub(@root_dir, '') + '.js'
        end

        if path.match(/^(.*)\.js$/)
          return $1.sub(@root_dir, '') + '.js'
        end
      end
    end
  end
end
