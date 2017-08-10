# jot

[![Travis](https://img.shields.io/travis/Pinjasaur/jot.svg)](https://travis-ci.org/Pinjasaur/jot)

Jot down notes in Markdown.
Inspired by [sts10/jot](https://github.com/sts10/jot).

Requires Bash >= 4 (for
[`globstar`][globstar]).

## Installation

Add the `jot` script to your `$PATH`.

`jot` defaults to writing to `$HOME/Notes`. You can customize this by setting
`$JOT_PATH` to something else (e.g. `export JOT_PATH="$HOME/Dropbox/Notes"`).

## Usage

```
jot [<arguments>]

Options:
  -h --help  Display help.
  -l --list  List notes.
  <name>     Create a note named <name>.md.
             If you want it in a path, use slashes (e.g. foo/bar/baz).
```

## License

[MIT &copy; Paul Esch-Laurent](/LICENSE).


[globstar]: https://www.linuxjournal.com/content/globstar-new-bash-globbing-option
