# jot

[![Travis](https://img.shields.io/travis/Pinjasaur/jot.svg)](https://travis-ci.org/Pinjasaur/jot)

Jot down notes in Markdown.
Inspired by [sts10/jot](https://github.com/sts10/jot).

Requires Bash >= 4 (for [`globstar`][globstar]).

## Installation

Add the [`jot` script](/jot) to your `$PATH` or create a function similar to:

```bash
jot() { 
  bash /path/to/jot "${@}" 
}
```

`jot` defaults to writing to `$HOME/Notes`. You can customize this by setting
`$JOT_DIR` to something else (e.g. `export JOT_DIR="$HOME/Dropbox/Notes"`).

You'll also want to make sure `$EDITOR` is set to your preferred editor 
(e.g. `export EDITOR='vim'`).

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

[MIT][license] &copy; Paul Esch-Laurent.

[license]: https://pinjasaur.mit-license.org/2017
[globstar]: https://www.linuxjournal.com/content/globstar-new-bash-globbing-option
