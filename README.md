# Few

When you're trying to build an application on your terminal, how would you see
the README file? `less` is common. But `less` uses a whole screen. These days
most terminal emulator softwares support transparency. You can see other
softwares under the terminal. If you can open the README file under the terminal
beautifully, it must be useful. That's the reason why `few` was created.

## INSTALL

### git

    $ git clone http://github.com/ujihisa/few.git /install/path
    $ export PATH=/install/path/bin:$PATH # And write it to shell rc file too
    $ few --help

### Rubygems

    $ gem install few
    $ few --help

## USAGE

    $ few README

    $ cat README | few

    $ few -v
    0.0.1

More usages are available in [wiki](http://wiki.github.com/ujihisa/few)

## DEVELOPERS

### The principles of `few`

* Does not require any non-standard libraries
* Works every Ruby from 1.8.6 to 1.9.2
    * Which means you have to avoid Enumerators and to care about Encodings
* (`spec/few` is OK of working only in 1.8.7+)

### Future plan

* markdown
* vim syntax highlight
* filetype detection and syntax file

## LICENCE

Ruby's Licence (GPL + MIT)

## TWITTER BOT

[@fewc](http://twitter.com/fewc)

## AUTHORS

* Tatsuhiro Ujihisa <http://ujihisa.blogspot.com/>
* Shota Fukumori (sora\_h) <http://codnote.net/>
* Haruo Nanki <http://blog.netswitch.jp/>

 vim: filetype=markdown
