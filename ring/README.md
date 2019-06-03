Let your data circulate
=======================

The 'ring' is an idea for misusing the unix pipes and files creatively. It
consists basically of tail -f'ing the end of an existing file, and
appending to it at the same time, like for example:

	tail -f a >>a

Files
-----

All these scripts need the rc shell installed, available
with [plan9port](https://swtch.com/plan9port/),
[9base](http://tools.suckless.org/9base) or
[standalone](https://www.github.com/rakitzis/rc).

*	[muring](https://github.com/niplav/ring/blob/master/muring):
	depends on [uu](https://www.github.com/niplav/uu). Creates mu expressions,
	starting from the content of [mu](./mu).
*	[ring1](./ring1): Creates md5sums, given a string in [sums](./sums).
*	[ring2](./ring2): is just a silly idea.
*	[webring](./webring): Crawls the web, starting with adresses given in [links](./links).

License
=======

See [LICENSE](./LICENSE).
