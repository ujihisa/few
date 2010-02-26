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

db.transaction do
  db['body']    ||= {}
  db['aes_key'] ||= {}
end

if cgi.has_key?('body') && cgi.has_key?('aes_key')
  begin
    db.transaction do
      db['body'][cgi['public_key']] = cgi['body']
      db['aes_key'][cgi['public_key']] = cgi['aes_key']
    end
  rescue
    error_exit
  rescue PStore::Error
    error_exit
  else
    puts "ok"
  end
else
  db.transaction do
    if db['body'][cgi['public_key']].nil? && db['aes_key'][cgi['public_key']].nil?
      puts 'no'
    else
      puts 'have'
      print db['body'][cgi['public_key']] + "\n--- ('.v.') < hi ---\n" + db['aes_key'][cgi['public_key']]
      db['body'].delete(cgi['public_key'])
      db['aes_key'].delete(cgi['public_key'])
    end
  end
end
