#!/bin/bash

# Create directory for personal configurations if it doesn't exist
mkdir -p ~/.personal_config

# Clone your aliases repository if it doesn't exist
if [ ! -d ~/.personal_config/my-aliases ]; then
    git clone https://github.com/eolasd/linux_aliases.git ~/.personal_config/my-aliases
fi

# Create a master aliases file that will source all individual .alias files
MASTER_ALIAS_FILE=~/.personal_config/my-aliases/master.aliases.sh

# Create or clear the master aliases file
cat > "$MASTER_ALIAS_FILE" << 'EOL'
#!/bin/bash
# Master aliases file - sources all .alias files in the directory
EOL

# Find all .alias files and add them to the master file
find ~/.personal_config/my-aliases -name "*.alias" -type f | while read alias_file; do
    echo "[ -f \"$alias_file\" ] && source \"$alias_file\"" >> "$MASTER_ALIAS_FILE"
done

# Make the master aliases file executable
chmod +x "$MASTER_ALIAS_FILE"

# Check if source line exists in shell rc files
for rc_file in ~/.bashrc ~/.zshrc; do
    if [ -f "$rc_file" ]; then
        SOURCE_LINE="[ -f \"$MASTER_ALIAS_FILE\" ] && source \"$MASTER_ALIAS_FILE\""
        if ! grep -q "source.*master.aliases.sh" "$rc_file"; then
            echo "" >> "$rc_file"
            echo "# Personal aliases from GitHub" >> "$rc_file"
            echo "$SOURCE_LINE" >> "$rc_file"
        fi
    fi
done

# Create example .alias file if no alias files exist
if [ ! "$(find ~/.personal_config/my-aliases -name "*.alias" -type f)" ]; then
    cat > ~/.personal_config/my-aliases/default.alias << 'EOL'
# Default Personal Aliases
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

# Determine which shell is being used
if [ -n "$ZSH_VERSION" ]; then
    echo "Refreshing zsh configuration..."
    source ~/.zshrc
elif [ -n "$BASH_VERSION" ]; then
    echo "Refreshing bash configuration..."
    source ~/.bashrc
fi

echo "Alias setup complete! All .alias files have been configured."
echo "Current alias files found:"
find ~/.personal_config/my-aliases -name "*.alias" -type f | while read alias_file; do
    echo "  - $(basename "$alias_file")"
done
