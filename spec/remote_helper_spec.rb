require File.dirname(__FILE__) + '/spec_helper'

describe Few::RemoteHelper do
  before(:all) do
    @pub     = nil
    @priv    = nil
    @crypted = nil
    @r       = Few::RemoteHelper.new
  end

  it 'generate key pair by generate_key_pair' do
    @r.generate_key_pair
  end

  it 'can get keys' do
    @r.public_key.should  be_a_kind_of(String)
    @r.private_key.should be_a_kind_of(String)
    @pub  = @r.public_key
    @priv = @r.private_key
  end

  it 'can create with exist key pair' do
    @r = Few::RemoteHelper.new(:public_key => @pub,:private_key => @priv)
    @r.public_key.should  == @pub
    @r.private_key.should == @priv
  end

  it 'crypt can crypt a string' do
    @crypted      = @r.crypt('hi')
    @crypted.should be_a_kind_of(String)
  end

  it 'decrypt can decrypt a string' do
    @crypted      = @r.crypt('hi')
    @r.decrypt(@crypted).should == 'hi'
  end
end
