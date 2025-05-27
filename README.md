# Dotfiles

A collection of shell scripts and "dotfiles" that I use on my machines.

Copyright © 2025 by Rob Dumas. Licensed under the BSD-3-clause license.

## Usage

1. Clone this repo to `$HOME/.dotfiles`.
2. Run `dotfiles.sh link` to put the proper files into place.

Open a new terminal for it to take effect.

## Bulk Installation

### On macOS

The file `macos/Brewfile` contains a list of [Homebrew](https://brew.sh/) taps, fonts, formulae, casks, and even apps from the App Store. Install everything in it with `brew bundle --file "$HOME/.dotfiles/macos/Brewfile`.

## Handling Sensitive Information

Don't put passwords or other sensitive information in these files. Instead, the scripts look for a file called `.localrc`, a hidden (that's what the filename starting with a dot means) shell script located in `$HOME` that it will read and interpret. This file is where you should put your passwords, API tokens, etc. Please note that `.localrc` should be treated as containing sensitive information; for this reason, it should not be committed to any Git repo without careful consideration.
