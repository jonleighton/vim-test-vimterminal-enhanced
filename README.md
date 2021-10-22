# vim-test-vimterminal-enhanced

This plugin provides a [custom
strategy](https://github.com/vim-test/vim-test#custom-strategies) for
[vim-test](https://github.com/vim-test/vim-test) with some opinionated
enhancements to the official `vimterminal` strategy:

* Only one test window is shown at once. If you run a test when a test window
  is already open, the new output will replace the old.
* When the test runs, the cursor stays where it is rather than switching to the
  test window.
* The `:TestClose` command closes the test window. You can set up a mapping for
  this to close the window while the cursor is outside of it.
* `CTRL-C` in the test window will abort the test run and close the window
* Line numbers are not shown in the test window
* The test buffer is unlisted

This code started life as a [pull
request](https://github.com/vim-test/vim-test/pull/347) to `vim-test`, but
has been extracted as a separate plugin that you can choose to separately
enable or disable.

## Installation

Using [vim-plug](https://github.com/junegunn/vim-plug), add

```
Plug 'jonleighton/vim-test-vimterminal-enhanced'
```

To your `.vimrc` file, after the `Plug` line for `vim-test` itself. Then run `:PlugInstall`.

`let g:test#strategy = 'vimterminal_enhanced'` is set by default when the
plugin is loaded so there are no more steps.

## Usage

You may wish to add a mapping for the `:TestClose` command:

```
nmap <silent> t<C-c> :TestClose<CR>
```

The plugin obeys the `test#vim#term_position` setting that is [already
available for the default `vimterminal`
strategy](https://github.com/vim-test/vim-test#vim8--neovim-terminal-position):

```
let test#vim#term_position = "belowright"
```

## License

Distributed under the same terms as Vim itself. See `:help license`.
