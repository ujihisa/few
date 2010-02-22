require File.dirname(__FILE__) + '/spec_helper.rb'

describe FewConfig do
  it 'new is private method' do
    lambda {FewConfig.new}.should raise_error(NoMethodError)
  end
  
  it 'can store with self[]=' do
    FewConfig[:a] = 1
  end

  it 'can read with self[]' do
    FewConfig[:a].should == 1
  end
  
  it 'can store with self.<name>=' do
    FewConfig.b = 2
  end

  it 'can read with self.<name>' do
    FewConfig.b.should == 2
  end
end
