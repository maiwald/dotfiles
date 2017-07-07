if [ -f ~/.bashrc ];
then
  source ~/.bashrc
fi

# initialize Nix
if [ -e /Users/maiwald/.nix-profile/etc/profile.d/nix.sh ]; then
  . /Users/maiwald/.nix-profile/etc/profile.d/nix.sh;
fi
