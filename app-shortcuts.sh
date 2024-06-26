appFolder=~/Applications
mkdir -p "$appFolder"

for appName in $(ls ~/.nix-profile/Applications)
do
  app=~/.nix-profile/Applications/$appName
  rm "$appFolder/$appName"
  osascript \
    -e "tell app \"Finder\"" \
    -e "make new alias file at POSIX file \"$appFolder\" to POSIX file \"$app\"" \
    -e  "set name of result to \"$appName\"" \
    -e "end tell"
done

echo '-----'
echo 'Now goto: Settings -> Spotlight -> Privacy'
echo 'Add add remove ~/Applications folder so it will reindex'
# TODO there must be a better way...
