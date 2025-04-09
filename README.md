# nixos-bash

nixos-bash = fetchGit {
	url = "https://github.com/typovrak/nixos-bash.git";
	ref = "main";
};

(import "${nixos-bash}/configuration.nix")
