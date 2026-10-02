# glevski/homebrew-tap

Homebrew formulae for glevski tools.

## worktrees

[wt](https://wt.glevski.com) — a fast git worktree manager. The formula
installs the `worktree` binary from the latest
[glevski/wt](https://github.com/glevski/wt) release.

```sh
brew install glevski/tap/worktrees
```

Then wire up the `wt` shell function in your `~/.zshrc` (or `~/.bashrc` with
`bash`):

```sh
eval "$(worktree init zsh)"
```
