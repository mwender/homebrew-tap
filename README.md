# mwender/homebrew-tap

Homebrew formulae by [Michael Wender](https://github.com/mwender).

## SpinupTUI

A terminal dashboard for browsing, monitoring, and managing your [SpinupWP](https://spinupwp.com) servers and sites. See [mwender/spinupwp-tui](https://github.com/mwender/spinupwp-tui) for what it does.

```sh
brew install mwender/tap/spinuptui
spinuptui login   # save your SpinupWP API token (once)
spinuptui
```

Update with `brew upgrade spinuptui`. Homebrew installs [Bun](https://bun.sh) as a dependency; SpinupTUI runs on it.
