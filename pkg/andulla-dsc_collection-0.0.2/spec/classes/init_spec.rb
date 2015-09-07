require 'spec_helper'
describe 'dsc_collection' do

  context 'with defaults for all parameters' do
    it { should contain_class('dsc_collection') }
  end
end
