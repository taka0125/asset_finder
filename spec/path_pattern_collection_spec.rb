describe AssetFinder::PathPatternCollection do
  describe '#match?' do
    subject { described_class.new(path_patterns: path_patterns).match?(path: path) }

    let(:path_patterns) do
      [
        AssetFinder::PathPattern.new(pattern: /^(.*)\.scss$/),
        AssetFinder::PathPattern.new(pattern: /^(.*)\.css$/),
      ]
    end

    context 'マッチする' do
      let(:path) { 'app/assets/javascripts/test.css' }

      it { expect(subject).to be true }
    end

    context 'マッチしない' do
      let(:path) { 'app/assets/javascripts/test.sass' }

      it { expect(subject).to be false }
    end
  end

  describe '#match' do
    subject { described_class.new(path_patterns: path_patterns).match(path: path) }

    let(:path_patterns) do
      [
        AssetFinder::PathPattern.new(pattern: /^(.*)\.scss$/),
        AssetFinder::PathPattern.new(pattern: /^(.*)\.css$/),
      ]
    end

    context 'マッチする' do
      let(:path) { 'app/assets/javascripts/test.css' }

      it 'マッチした情報を返す' do
        results = subject

        expect(results).to be_a MatchData
        expect(results[0]).to eq 'app/assets/javascripts/test.css'
        expect(results[1]).to eq 'app/assets/javascripts/test'
      end
    end

    context 'マッチしない' do
      let(:path) { 'app/assets/javascripts/test.sass' }

      it { expect(subject).to be_nil }
    end
  end
end
