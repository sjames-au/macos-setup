packer {
  required_plugins {
    tart = {
      version = ">= 1.2.0"
      source  = "github.com/cirruslabs/tart"
    }
  }
}

source "tart-cli" "tart" {
  vm_base_name = "ghcr.io/cirruslabs/macos-sonoma-vanilla:latest"
  vm_name      = "sonoma-workstation-test"
  cpu_count    = 4
  memory_gb    = 8
  disk_size_gb = 50
  ssh_password = "admin"
  ssh_username = "admin"
  ssh_timeout  = "120s"
}

build {
  sources = ["source.tart-cli.tart"]

  // provisioner "file" {
  //   source      = "data/limit.maxfiles.plist"
  //   destination = "~/limit.maxfiles.plist"
  // }

  // provisioner "shell" {
  //   inline = [
  //     "echo 'Configuring maxfiles...'",
  //     "sudo mv ~/limit.maxfiles.plist /Library/LaunchDaemons/limit.maxfiles.plist",
  //     "sudo chown root:wheel /Library/LaunchDaemons/limit.maxfiles.plist",
  //     "sudo chmod 0644 /Library/LaunchDaemons/limit.maxfiles.plist",
  //     "echo 'Disabling spotlight...'",
  //     "sudo mdutil -a -i off",
  //   ]
  // }

  # Create a symlink for bash compatibility
  provisioner "shell" {
    inline = [
      "touch ~/.zprofile",
      "ln -s ~/.zprofile ~/.profile",
    ]
  }

  # install homebrew
  provisioner "shell" {
    inline = [
      "/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\"",
      "echo \"export LANG=en_US.UTF-8\" >> ~/.zprofile",
      "echo 'eval \"$(/opt/homebrew/bin/brew shellenv)\"' >> ~/.zprofile",
      "echo \"export HOMEBREW_NO_AUTO_UPDATE=1\" >> ~/.zprofile",
      "echo \"export HOMEBREW_NO_INSTALL_CLEANUP=1\" >> ~/.zprofile",
      "source ~/.zprofile",
      "brew --version",
      "brew update",
      "brew install wget cmake gcc git-lfs jq gh gitlab-runner",
      "git lfs install",
    ]
  }

  provisioner "shell" {
    inline = [
      "source ~/.zprofile",
      "brew install ansible",
    ]
  }
}
