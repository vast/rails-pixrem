require 'spec_helper'

describe RailsPixrem::Sprockets do
  let(:assets) { Sprockets::Environment.new }
  let(:processor) { RailsPixrem::Processor.new }
  let(:pixrem) { described_class.new(processor) }

  before do
    assets.append_path(Pathname(__FILE__).dirname.join('../dummy/app/assets/stylesheets'))
    pixrem.install(assets)
  end

  it 'works with Sprockets' do
    assets['test.css'].to_s.should == "i {\n" +
                                      "  padding: 16px;\n" +
                                      "  padding: 1rem\n" +
                                      "}\n"
  end
end
