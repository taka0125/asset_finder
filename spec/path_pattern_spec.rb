describe AssetFinder::PathPattern do
  describe '#match?' do
    subject { described_class.new(pattern: pattern).match?(path: path) }

    let(:pattern) { /^(.*)\.scss$/ }

    context 'マッチする' do
      let(:path) { 'app/assets/javascripts/test.scss' }

      it { expect(subject).to be true }
    end

    context 'マッチしない' do
      let(:path) { 'app/assets/javascripts/test.css' }

      it { expect(subject).to be false }
    end
  end

  describe '#match' do
    subject { described_class.new(pattern: pattern).match(path: path) }

    let(:pattern) { /^(.*)\.scss$/ }

    context 'マッチする' do
      let(:path) { 'app/assets/javascripts/test.scss' }

      it 'マッチした情報を返す' do
        results = subject

        expect(results).to be_a MatchData
        expect(results[0]).to eq 'app/assets/javascripts/test.scss'
        expect(results[1]).to eq 'app/assets/javascripts/test'
      end
    end

    context 'マッチしない' do
      let(:path) { 'app/assets/javascripts/test.css' }

      it { expect(subject).to be_nil }
    end
  end
end
