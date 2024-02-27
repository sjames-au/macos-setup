# macOS Setup Ansible Project

## Overview

This project leverages Ansible for automating the setup and configuration of macOS machines, tailored for personal preferences, development setups, work requirements, and dotfiles management. It aims to provide a flexible and customizable approach to configure various aspects of macOS.

## Roles

### personal-base

- **Description**: Establishes basic macOS preferences and configurations common across all machines. Includes system settings, Finder customizations, and essential software installations.

### development

- **Description**: Sets up the machine with development tools, programming languages, and environments. Covers installations of languages like Python, Ruby, editors such as VS Code, and other development utilities.

### work

- **Description**: Applies configurations and installs software specific to work needs. May include setting up VPNs, work-specific applications, and configuring email clients.

### macos-config

- **Description**: Delves into deeper macOS configurations not covered in `personal-base`. Adjusts security settings, advanced system preferences, and user interface customizations.

### dotfiles

- **Description**: Manages the deployment and maintenance of dotfiles, ensuring consistent shell and application settings across machines. Handles dotfile manager setup, repository syncing, and symlink creations.

## Usage

To utilize this project, ensure Ansible is installed on your machine. Clone the repository and execute `ansible-pull` with the repository URL and the specific branch to apply configurations.

Example command:

```bash
ansible-pull -U <repository-url> -C <branch> <role>.yml
```

Replace <repository-url> with your GitHub repository URL, <branch> with your desired branch, and <role> with the specific role to apply.

## Contributing

Improvements and expansions are welcome. Feel free to fork the repository, make changes, and submit a pull request for review.
