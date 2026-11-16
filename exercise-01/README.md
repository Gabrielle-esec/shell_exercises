# Exercise 01 — Development Environment Setup

## Objective

Learn the basics of shell scripting by automating the setup of a Python development environment.

## Features

- Detect the operating system (macOS or Linux).
- Check whether Python 3 is installed and install it if necessary.
- Verify that pip is available.
- Install Jupyter Notebook in an isolated virtual environment.
- Run Homebrew diagnostics on macOS.
- Display readable status messages.

## Prerequisites

- Bash
- Homebrew on macOS
- A Debian/Ubuntu-based distribution for Linux installation support

## Usage

```bash
chmod +x env_install.sh
./env_install.sh
```

## Environment Tested

- macOS
- Python 3.13.7
- pip 26.0.1
- Homebrew 6.0.22

## What I Learned

- The difference between a terminal and a shell
- how hard it is at first to move around and do the correct thing
- Bash functions and executable permissions
- Package managers and virtual environments
