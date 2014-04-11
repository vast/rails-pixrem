require 'spec_helper'

describe CssController, type: :controller do
  subject { response }

  before { get :test }

  it { should be_success }
  its(:body) { should include('margin: 3rem;') }
  its(:body) { should include('margin: 48px;') }
end
