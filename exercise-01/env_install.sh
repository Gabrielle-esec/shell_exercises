
#!/usr/bin/env bash

# Development environment setup script
# Exercise 01 - Shell and Bash scripting


# -----------------------------------------
# 1. FUNCTION DEFINITIONS
# -----------------------------------------

# Print a message with blank lines for readability
pretty_print() {
    printf '\n%s\n\n' "$1"
}


# Check whether Python 3 is installed
check_python() {
    if command -v python3 >/dev/null 2>&1; then
        pretty_print "Python is already installed."
        python3 --version
    else
        pretty_print "Python 3 is missing. Installing..."

        if [[ "$OSTYPE" == darwin* ]]; then
            brew install python || return 1

        elif [[ "$OSTYPE" == linux* ]]; then
            sudo apt-get update || return 1
            sudo apt-get install -y python3 python3-pip || return 1

        else
            pretty_print "Unsupported operating system."
            return 1
        fi
    fi
}


# Verify that pip is available
check_pip() {
    if python3 -m pip --version >/dev/null 2>&1; then
        pretty_print "Pip is installed."
        python3 -m pip --version
    else
        pretty_print "ERROR: Pip is not available."
        return 1
    fi
}


# Install Jupyter Notebook in a virtual environment
install_jupyter() {
    pretty_print "Setting up Jupyter Notebook..."

    # Create an isolated Python environment
    if [[ ! -d "$HOME/.venvs/shell-exercise" ]]; then
        mkdir -p "$HOME/.venvs"
        python3 -m venv "$HOME/.venvs/shell-exercise" || return 1
    fi

    # Install Jupyter only if it is missing
    if ! "$HOME/.venvs/shell-exercise/bin/python" -m pip show notebook >/dev/null 2>&1; then
        "$HOME/.venvs/shell-exercise/bin/python" -m pip install notebook || return 1
    fi

    pretty_print "Jupyter Notebook is ready!"
    "$HOME/.venvs/shell-exercise/bin/jupyter" --version
}
# Check Homebrew health on macOS
check_homebrew() {
    if [[ "$OSTYPE" == darwin* ]]; then
        pretty_print "Checking Homebrew health..."

        if command -v brew >/dev/null 2>&1; then
            brew doctor
        else
            pretty_print "ERROR: Homebrew is not installed."
            return 1
        fi
    fi
}

# -----------------------------------------
# 2. MAIN SCRIPT
# -----------------------------------------

pretty_print "Starting environment setup..."


# Detect the operating system
if [[ "$OSTYPE" == darwin* ]]; then
    pretty_print "Operating system: macOS"

elif [[ "$OSTYPE" == linux* ]]; then
    pretty_print "Operating system: Linux"

else
    pretty_print "Unsupported operating system: $OSTYPE"
    exit 1
fi


# Run setup functions
check_python || exit 1
check_pip || exit 1
install_jupyter || exit 1
check_homebrew || exit 1

pretty_print "Environment setup completed successfully!"

