require File.dirname(__FILE__) + '/spec_helper'

describe Few::RemoteHelper do
  before(:all) do
    @r = Few::RemoteHelper.new
  end

  it 'generates key pair by generate_key_pair, and gets keys by accessors' do
    @r.generate_key_pair

    @r.public_key.should  be_a_kind_of(String)
    @r.private_key.should be_a_kind_of(String)
    @pub  = @r.public_key
    @priv = @r.private_key
  end

  it 'can create with exist key pair' do
    @r = Few::RemoteHelper.new(:public_key => @pub, :private_key => @priv)
    @r.public_key.should  == @pub
    @r.private_key.should == @priv
  end

  it 'crypt can crypt a string' do
    @crypted      = @r.crypt('hi')
    @crypted.should    be_a_kind_of(Array)
    @crypted[0].should be_a_kind_of(String)
    @crypted[1].should be_a_kind_of(String)
  end

  it 'decrypt can decrypt a string' do
    @crypted      = @r.crypt('hi')
    @r.decrypt(*@crypted).should == 'hi'
  end

  begin
    require 'ww/server'
  rescue LoadError
    puts "WARNING: You're not installed 'ww' library, " +
      "don't run send and recv specs now."
  else
    describe 'send and recv' do
      before(:all) do
        r     = Few::RemoteHelper.new.generate_key_pair
        @pub  = r.public_key
        @priv = r.private_key
        Ww::Server[:few_server] ||= Ww::Server.build_double(4328) do
          $few_remote_helper_spec_ww_s     = {}
          $few_remote_helper_spec_ww_s_key = {}
          get('/') do
            content_type :text
            if $few_remote_helper_spec_ww_s[params["public_key"]] && $few_remote_helper_spec_ww_s_key[params["public_key"]]
              r = $few_remote_helper_spec_ww_s[params["public_key"]]
              k = $few_remote_helper_spec_ww_s_key[params["public_key"]]
              $few_remote_helper_spec_ww_s.delete(params["public_key"])
              $few_remote_helper_spec_ww_s_key.delete(params["public_key"])
              "have\n" + r + "\n--- ('.v.') < hi ---\n" + k
            else
              "no"
            end
          end

          post('/') do
            content_type :text
            $few_remote_helper_spec_ww_s[params["public_key"]] = params["body"]
            $few_remote_helper_spec_ww_s_key[params["public_key"]] = params["aes_key"]
            "ok\n"
          end
        end
        Ww::Server[:few_server].start_once
      end

      before do
        @r = Few::RemoteHelper.new(
          :public_key => @pub, :private_key => @priv,
          :remote_path => 'http://localhost:4328/')
      end

      it 'also send to server by #send' do
        @r.send('hi').should be_true
      end

      it 'also recieve from server by #recv' do
        @r.send('hi').should be_true
        @r.recv.should == 'hi'
      end
    end
  end
end
