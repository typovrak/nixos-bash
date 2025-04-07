{ config, pkgs, ... }:

let
	username = "typovrak";
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts = {
		bash = ''
			export PATH=${pkgs.coreutils}/bin:$PATH
			rm -rf /bin/bash
			mkdir -p /bin
			ln -sF /etc/bin/bash /bin/bash
		'';
	};

	environment.etc."bin/bash".source = "${pkgs.bash}/bin/bash";
}
