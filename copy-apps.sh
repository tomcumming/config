# Copy rather than link so it shows up in finder etc
for appName in $(ls ~/.nix-profile/Applications)
do
  chmod -R +xw ~/Applications/$appName
  rm -rf ~/Applications/$appName
  cp -r -L ~/.nix-profile/Applications/$appName ~/Applications/$appName
done
