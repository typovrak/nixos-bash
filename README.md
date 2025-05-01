# 🐚 NixOS Bash

> Declarative NixOS module to install Nix’s Bash into /bin/bash, update PATH and ensure a consistent system shell.

## 📦 Features

- 🔧 **Bash symlink :** Ensures ```/bin/bash``` points to the Nix-provided Bash binary via ```/etc/bin/bash```.

- ⚙️ **PATH update :** Prepends ```coreutils``` to ```$PATH``` during activation to guarantee standard utilities availability.

- 🔄 **Idempotent :** Safe to run on every ```nixos-rebuild```, will update the symlink if Bash is upgraded.

- 🔒 **No data loss :** Does not remove any user data, only replaces ```/bin/bash```.

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
No backup needed for this module.

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-bash = fetchGit {
    url = "https://github.com/typovrak/nixos-bash.git";
    ref = "main";
    rev = "8556f10b3ac702412e62b0be69553d04105de01f"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-bash}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

## 🎬 Usage

Verify with
```bash
/bin/bash --version
```

Then run a script with the shebang ```#! /bin/bash``` instead of ```#!/usr/bin/env bash```, this will work even in NixOS now !

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
