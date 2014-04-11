require 'spec_helper'

describe RailsPixrem::Processor do
  describe '#process' do
    let(:sample_css) { '#foo { padding: 2rem }' }
    let(:processor) { described_class.new }
    subject { processor.process(sample_css) }

    it { should include('padding: 32px;') }
    it { should include('padding: 2rem') }
  end
end
