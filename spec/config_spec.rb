require File.dirname(__FILE__) + '/spec_helper.rb'

describe Few::Config do
  before(:all) do
    @config = Few::Config.new
  end

  it 'can store with self.<name>=' do
    @config.b = 2
  end

  it 'can read with self.<name>' do
    @config.b.should == 2
  end

  it 'can set default values on initialize' do
    Few::Config.new(:foo => :bar).foo.should == :bar
  end
end
