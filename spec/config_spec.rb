require File.dirname(__FILE__) + '/spec_helper.rb'

describe Few::Config do
  before(:all) do
    @config = Few::Config.new
  end
  
  it 'can store with self[]=' do
    Few::Config[:a] = 1
  end

  it 'can read with self[]' do
    Few::Config[:a].should == 1
  end
  
  it 'can store with self.<name>=' do
    Few::Config.b = 2
  end

  it 'can read with self.<name>' do
    Few::Config.b.should == 2
  end
end
