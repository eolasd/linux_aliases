# Command Line Shortcuts Reference

A comprehensive guide to available command line shortcuts and aliases, organized by category.

## Table of Contents
- [Directory Navigation](#directory-navigation)
- [Git Commands](#git-commands)
  - [Basic Git Operations](#basic-git-operations)
  - [Branching and Checkout](#branching-and-checkout)
  - [Commit Operations](#commit-operations)
  - [Remote Operations](#remote-operations)
  - [Stash Operations](#stash-operations)
  - [Advanced Git Operations](#advanced-git-operations)
- [System Commands](#system-commands)
- [Search Shortcuts](#search-shortcuts)

## Directory Navigation

| Alias | Command | Description |
|-------|---------|-------------|
| `-` | `cd -` | Go to previous directory |
| `...` | `../..` | Go up 2 directories |
| `....` | `../../..` | Go up 3 directories |
| `.....` | `../../../..` | Go up 4 directories |
| `1` | `cd -1` | Go to 1st directory in history |
| `2-9` | `cd -2` etc. | Go to nth directory in history |

## Git Commands

### Basic Git Operations

| Alias | Command | Description |
|-------|---------|-------------|
| `g` | `git` | Git shorthand |
| `gs` | `git status` | Check status |
| `ga` | `git add` | Add files |
| `gaa` | `git add --all` | Add all files |
| `gc` | `git commit --verbose` | Commit with verbose output |
| `gcm` | `git checkout $(git_main_branch)` | Checkout main branch |
| `gp` | `git push` | Push changes |
| `gl` | `git pull` | Pull changes |

### Branching and Checkout

| Alias | Command | Description |
|-------|---------|-------------|
| `gb` | `git branch` | List branches |
| `gba` | `git branch --all` | List all branches |
| `gbd` | `git branch --delete` | Delete branch |
| `gcb` | `git checkout -b` | Create and checkout new branch |
| `gco` | `git checkout` | Checkout branch |
| `gsw` | `git switch` | Switch branches |

### Commit Operations

| Alias | Command | Description |
|-------|---------|-------------|
| `gcam` | `git commit --all --message` | Commit all with message |
| `gc!` | `git commit --verbose --amend` | Amend last commit |
| `gcn!` | `git commit --no-edit --amend` | Amend without editing |
| `gca!` | `git commit --all --amend` | Amend adding all changes |

### Remote Operations

| Alias | Command | Description |
|-------|---------|-------------|
| `gf` | `git fetch` | Fetch changes |
| `gfa` | `git fetch --all --tags` | Fetch everything |
| `gfo` | `git fetch origin` | Fetch from origin |
| `gr` | `git remote` | List remotes |
| `gra` | `git remote add` | Add remote |
| `grv` | `git remote --verbose` | List remotes verbosely |

### Stash Operations

| Alias | Command | Description |
|-------|---------|-------------|
| `gsta` | `git stash push` | Stash changes |
| `gstp` | `git stash pop` | Pop stash |
| `gstl` | `git stash list` | List stashes |
| `gstc` | `git stash clear` | Clear stash |
| `gstd` | `git stash drop` | Drop stash |

### Advanced Git Operations

| Alias | Command | Description |
|-------|---------|-------------|
| `grb` | `git rebase` | Rebase |
| `grbm` | `git rebase $(git_main_branch)` | Rebase on main |
| `grbi` | `git rebase --interactive` | Interactive rebase |
| `gwip` | `git add -A; git commit --no-verify --message "--wip--"` | WIP commit |
| `gwipe` | `git reset --hard; git clean -df` | Wipe all changes |

## System Commands

| Alias | Command | Description |
|-------|---------|-------------|
| `l` | `ls -lah` | List all files with details |
| `ll` | `ls -lh` | List files with details |
| `la` | `ls -lAh` | List all except . and .. |
| `md` | `mkdir -p` | Create directory with parents |
| `rd` | `rmdir` | Remove directory |
| `_` | `sudo ` | Sudo with space for alias expansion |

## Search Shortcuts

| Alias | Command | Description |
|-------|---------|-------------|
| `google` | `web_search google` | Search Google |
| `github` | `web_search github` | Search GitHub |
| `stackoverflow` | `web_search stackoverflow` | Search Stack Overflow |
| `ddg` | `web_search duckduckgo` | Search DuckDuckGo |
| `dockerhub` | `web_search dockerhub` | Search Docker Hub |
| `npmpkg` | `web_search npmpkg` | Search NPM packages |
| `youtube` | `web_search youtube` | Search YouTube |

## Notes

- All git aliases assume you're in a git repository
- Web search aliases require the web_search function from Oh-My-Zsh
- Directory history aliases (1-9) require directory history to be enabled
- Some git aliases use dynamic branch name detection (`git_main_branch` function)

## Tips

1. Use `gss` or `gs` frequently to check git status
2. `gwip` is great for quickly saving work in progress
3. Always use `gpf` (force-with-lease) instead of `gpf!` (force) for safety
4. Use `gfa` periodically to keep your repository up to date
5. `gst` is your friend for quickly checking status
