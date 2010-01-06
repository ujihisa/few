describe 'few' do
  it 'is awesome' do
    def open_browser(path); path; end
    def ARGF.read; 'a'; end
    def ARGF.filename; 'b'; end
    few.should be_an_instance_of(String)
  end
end
