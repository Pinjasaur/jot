# jot

[![Travis](https://img.shields.io/travis/Pinjasaur/jot.svg)](https://travis-ci.org/Pinjasaur/jot)

Jot down notes in Markdown.
Inspired by [sts10/jot](https://github.com/sts10/jot).

Requires Bash >= 4 (for [`globstar`][globstar]).

## Installation

Add the [`jot` script](/jot) to your `$PATH` or create a function similar to:

```bash
jot() { 
  /path/to/jot "${@}" 
}
```

`jot` defaults to writing to `$HOME/Notes`. You can customize this by setting
`$JOT_DIR` to something else (e.g. `export JOT_DIR="$HOME/Dropbox/Notes"`).

You'll also want to make sure `$EDITOR` is set to your preferred editor 
(e.g. `export EDITOR='vim'`).

## Usage

Run `jot <name>` to start writing. You can list notes with `jot --list` and show
the usage info with `jot --help`:

```
jot [<arguments>]

Options:
  -h --help  Show this.
  -l --list  List notes.
  <name>     Create a note named <name>.md.
             If no <name>, the default is YYYY/MM/DD.md.
             You can also use slashes e.g. foo/bar to create foo/bar.md.
```

## Related

- [jt][jt] - Creates timestamped notes (simplified version of jot)
- [jrnl][jrnl] - Frictionless journaling from the CLI

## License

[MIT][license] &copy; Paul Esch-Laurent.

[jrnl]: https://github.com/Pinjasaur/jrnl
[jt]: https://github.com/Pinjasaur/jt
[license]: https://pinjasaur.mit-license.org/2017
[globstar]: https://www.linuxjournal.com/content/globstar-new-bash-globbing-option
