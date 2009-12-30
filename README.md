# Few

When you're trying to build an application on your terminal, how would you see the README file? `less` is common. But `less` uses a whole screen. These days most terminal emulator softwares support transparency. You can see other softwares under the terminal. If you can open the README file under the terminal beautifully, it must be useful. That's the reason why `few` was created.

## USAGE

    $ few README

    $ cat README | few

    $ few -v
    0.0.1

    $ few --selfupdate
    0.0.2

## DEVELOPERS

The principles of `few`

* Does not require any non-standard libraries
* Works every Ruby from 1.8.6 to 1.9.2
    * Which means you have to avoid Enumerators and to care about Encodings

Future plan

* markdown
* vim syntax highlight
* ssh over few

## LICENCE

Ruby's Licence (GPL + MIT)

## TWITTER BOT

[@fewc](http://twitter.com/fewc)

## AUTHOR

* Tatsuhiro Ujihisa <http://ujihisa.blogspot.com/>
* Sora Harakami <http://codnote.net/>

 vim: filetype=markdown
