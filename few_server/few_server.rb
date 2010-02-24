#!/usr/bin/env ruby
# vim: filetype=ruby
require 'cgi'
require 'pstore'

#### SETTINGS
STORE_FILE = File.dirname(__FILE__) + '/pstore' # path to store file.
#### END

print "Content-Type: text/plain\n\n"

def error_exit
  puts "error"
  exit
end

cgi = CGI.new
db = PStore.new(STORE_FILE)
error_exit unless cgi.has_key?('public_key')

if cgi.has_key?('body')
  begin
    db.transaction do
      db[cgi['public_key']] = cgi['body']
    end
  rescue
    error_exit
  rescue PStore::Error
    error_exit
  else
    puts "ok"
  end
else
  db.transaction(true) do
    if db[cgi['public_key']].nil?
      puts 'no'
    else
      puts 'have'
      print db[cgi['public_key']]
      db.delete(cgi['public_key'])
    end
  end
end
