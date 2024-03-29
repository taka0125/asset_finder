describe AssetFinder::Javascript::Normalizer do
  let(:root_dir) { '/data/rails/app/assets/javascripts/' }

  describe '#normalize' do
    subject { AssetFinder::Javascript::Normalizer.new(root_dir: root_dir, path_pattern_collection: path_pattern_collection, normalize_index_file: normalize_index_file).normalize(path) }

    let(:path_pattern_collection) { AssetFinder::Javascript::PathPatternCollection.build }
    let(:normalize_index_file) { true }

    context "extension is 'js'" do
      let(:path) { "#{root_dir}test/something.js" }
      it { is_expected.to eq 'test/something.js' }
    end

    context "extension is 'js.coffee'" do
      let(:path) { "#{root_dir}test/something.js.coffee" }
      it { is_expected.to eq 'test/something.js' }
    end

    context "extension is 'coffee'" do
      let(:path) { "#{root_dir}test/something.coffee" }
      it { is_expected.to eq 'test/something.js' }
    end

    context "extension is not javascripts" do
      let(:path) { "#{root_dir}test/something.txt" }
      it { is_expected.to be_nil }
    end

    context "add pattern" do
      let(:patterns) { [/^(.*)\.js\.jsx\.coffee$/] }
      let(:path) { "#{root_dir}test/something.js.jsx.coffee" }

      before do
        AssetFinder.config.javascript_patterns = patterns
      end

      after do
        AssetFinder.config.javascript_patterns = []
      end

      it { is_expected.to eq 'test/something.js' }
    end

    context 'index' do
      let(:path) { "#{root_dir}test/items/index.coffee" }

      context 'normalize_index_file = true' do
        let(:normalize_index_file) { true }

        it { is_expected.to eq 'test/items.js' }
      end

      context 'normalize_index_file = true' do
        let(:normalize_index_file) { false }

        it { is_expected.to eq 'test/items/index.js' }
      end
    end
  end
end
