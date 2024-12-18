#!/bin/bash

# Create directory for personal configurations if it doesn't exist
mkdir -p ~/.personal_config

# Clone your aliases repository if it doesn't exist
if [ ! -d ~/.personal_config/my-aliases ]; then
    git clone https://github.com/eolasd/linux-aliases.git ~/.personal_config/my-aliases
fi

# Check if the source line exists in .bashrc
SOURCE_LINE="[ -f ~/.personal_config/my-aliases/aliases.sh ] && source ~/.personal_config/my-aliases/aliases.sh"
if ! grep -q "source ~/.personal_config/my-aliases/aliases.sh" ~/.bashrc; then
    # Add newline for cleaner separation
    echo "" >> ~/.bashrc
    echo "# Personal aliases from GitHub" >> ~/.bashrc
    echo "$SOURCE_LINE" >> ~/.bashrc
fi

# Create example aliases.sh if it doesn't exist locally
if [ ! -f ~/.personal_config/my-aliases/aliases.sh ]; then
    cat > ~/.personal_config/my-aliases/aliases.sh << 'EOL'
# My Personal Aliases
alias ll='ls -la'
alias ..='cd ..'
alias ...='cd ../..'
alias gst='git status'
alias gl='git log'
alias update='sudo apt update && sudo apt upgrade -y'
alias timestamp='date "+%Y%m%d_%H%M%S"'
alias myip='curl -s ifconfig.me'
alias hg='history | grep '

# Add your custom aliases below this line
EOL
fi

echo "Alias setup complete! Source your .bashrc or start a new terminal session."
