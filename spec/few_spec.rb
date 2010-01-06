describe 'few command' do
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
    pending
  end

  it 'opens your browswer the HTML flavored data given by pipe' do
    # $ cat FILE | few
    pending
  end

  it 'opens your browswer the HTML flavored data given by parameter' do
    # $ few FILE
    pending
  end

  it 'also accepts --filetype= option' do
    pending # based on the last specification
  end
end
