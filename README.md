# Beni's dotfiles

* This is the Linux version of my dotfiles ([macOS version here](https://github.com/benitolopez/dotfiles-macos)).
* This setup is heavily based on the popular [mathias's dotfiles](https://github.com/mathiasbynens/dotfiles/).
* I'm not a *shell superhero* (not yet :)) so my dotfiles are really simple.
* I maintain this repo as *my* dotfiles.

## Installation

Clone the repository wherever you want. Then to update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

### Add custom commands to `.extra`

If `~/.extra` exists, it will be sourced along with the other files. In my `~/.extra` I have some personal details, like my Git credentials.
