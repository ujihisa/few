few_no_arg = File.read(File.dirname(__FILE__) + '/../bin/few')
few_no_arg.gsub!(/case ARGV\[0\].+/m,'')
eval few_no_arg
