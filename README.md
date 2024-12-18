# Linux Custom Shortcuts and Aliases Manager

A simple script to manage and synchronize personal aliases across multiple Linux machines using Git.

## Overview

This repository contains a setup script and aliases configuration that allows you to:
- Maintain a consistent set of aliases across all your Linux machines
- Version control your aliases using Git
- Easily deploy your aliases to new machines
- Keep your personal aliases separate from system/user existing configurations

## Quick Start

1. Fork this repository or create a new one
2. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/eolasd/linux_aliases.git my-aliases
   ```
3. Run the setup script:
   ```bash
   chmod +x setup-aliases.sh
   ./setup-aliases.sh
   ```
4. Source your `.bashrc` or start a new terminal session:
   ```bash
   source ~/.bashrc
   ```

## Repository Structure

```
.
├── README.md
├── setup-aliases.sh
└── aliases.sh
```

## Setup Script

The `setup-aliases.sh` script performs the following actions:
- Creates a `.personal_config` directory in your home folder
- Clones your aliases repository (if not already present)
- Adds a source line to your `.bashrc` that won't interfere with existing settings
- Creates an example `aliases.sh` if it doesn't exist

## Default Aliases

The default `aliases.sh` includes these commonly used aliases:
```bash
alias ll='ls -la'              # Detailed directory listing
alias ..='cd ..'               # Move up one directory
alias ...='cd ../..'           # Move up two directories
alias gst='git status'         # Git status shorthand
alias gl='git log'             # Git log shorthand
alias update='sudo apt update && sudo apt upgrade -y'  # System update
alias timestamp='date "+%Y%m%d_%H%M%S"'              # Current timestamp
alias myip='curl -s ifconfig.me'                      # Show public IP
```

## Usage

### First-Time Setup on a New Machine

1. Clone this repository:
   ```bash
   git clone https://github.com/eolasd/my-aliases.git
   ```

2. Run the setup script:
   ```bash
   cd my-aliases
   chmod +x setup-aliases.sh
   ./setup-aliases.sh
   ```

3. Start using your aliases:
   ```bash
   source ~/.bashrc
   ```

### Updating Your Aliases

1. Edit the `aliases.sh` file with your preferred aliases
2. Commit and push your changes:
   ```bash
   git add aliases.sh
   git commit -m "Updated aliases"
   git push origin main
   ```

3. On other machines, pull the updates:
   ```bash
   cd ~/.personal_config/my-aliases
   git pull
   ```

4. Source your `.bashrc` to apply changes:
   ```bash
   source ~/.bashrc
   ```

## Customization

To add your own aliases, edit the `aliases.sh` file. Add your aliases below the existing ones:

```bash
# My custom aliases
alias project='cd ~/projects'
alias serve='python3 -m http.server'
# Add more aliases here
```

## Troubleshooting

- If changes don't take effect immediately, make sure to source your `.bashrc`:
  ```bash
  source ~/.bashrc
  ```
- Check that the repository was cloned correctly:
  ```bash
  ls ~/.personal_config/my-aliases
  ```
- Verify the source line in your `.bashrc`:
  ```bash
  grep "personal_config" ~/.bashrc
  ```

## Contributing

Feel free to fork this repository and customize it for your needs. If you develop improvements that might be useful to others, please submit a pull request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
