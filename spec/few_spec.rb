require 'tempfile'

describe '`few` command' do
  before do
    @few = File.dirname(__FILE__) + '/../bin/few'
  end

  it 'shows help with -h option' do
    `#{@few} -h`.should match(/USAGE/)
  end

  it 'shows version with -v option' do
    `#{@few} -v`.should match(/\d\.\d\.\d/)
  end

  it 'updates itself with --selfupdate option' do
    # In other words: $ few --selfupdate
    t = Tempfile.new('few').path + '.rb'
    File.open(t, 'w') {|io|
      io.puts 'def open(*o, &b); p o; "#!\np 1"; end'
      io.puts 'def require(*o);end'
      io.puts 'def File.open(*o); end'
      io.puts 'def system(*o); end'
      io.puts 'load "bin/few"'
    }
    `ruby #{t} --selfupdate`.strip.should ==
      '["http://github.com/ujihisa/few/raw/master/bin/few"]'
  end

  it 'opens the HTML flavored data given by pipe on your browswer' do
    # In other words: $ cat FILE | few
    t = Tempfile.new('few').path + '.rb'
    File.open(t, 'w') {|io|
      io.puts 'def system(*o); p o; end'
      io.puts 'load "bin/few"'
    }
    cmd, arg = *eval(`echo 123 | ruby #{t}`)
    cmd.should == 'open'
    arg.should match(/\.html$/)
    File.read(arg).should match('123')
  end

  it 'opens the HTML flavored data given by parameter on your browswer' do
    # $ few FILE
    pending
  end

  it 'also accepts --filetype= option' do
    pending # based on the last specification
  end
end
