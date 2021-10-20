# Dock & Menu Bar

# Size
defaults write com.apple.dock "tilesize" -int "36"

# Magnification
# ???

# Position on screen
#defaults write com.apple.dock "orientation" -string "bottom"

# Minimize animation effect
#defaults write com.apple.dock "mineffect" -string "genie"

# Double-click window title bar action
# ???

# Animate opening applications
# ???

# Automatically hide and show the Dock
defaults write com.apple.dock "autohide" -bool "true"
#defaults write com.apple.dock "autohide-time-modifier" -float "0.5"
#defaults write com.apple.dock "autohide-delay" -float "0.5"

# Show indicators for open applications
# ???

# Show recent applications in Dock
defaults write com.apple.dock "show-recents" -bool "false"

# Automatically hide and show the Dock
# ???

# Dock items
# https://github.com/kcrawford/dockutil
#brew install dockutil
#dockutil --no-restart --remove all
#dockutil --no-restart --add "/Applications/Launchpad.app"
#defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'
#dockutil --no-restart --add "/Applications/Safari.app"
#dockutil --no-restart --add "/Applications/Brave Browser.app"
#dockutil --no-restart --add "/Applications/Firefox Developer Edition.app"
#dockutil --no-restart --add "/Applications/Google Chrome.app"
#defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'
#dockutil --no-restart --add "/Applications/Calendar.app"
#dockutil --no-restart --add "/Applications/Things.app"
#dockutil --no-restart --add "/Applications/Notion.app"
#dockutil --no-restart --add "/Applications/Trello.app"
#dockutil --no-restart --add "/Applications/Day One.app"
#dockutil --no-restart --add "/Applications/iA Writer.app"
#defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'
#dockutil --no-restart --add "/Applications/Mail.app"
#dockutil --no-restart --add "/Applications/Messages.app"
#dockutil --no-restart --add "/Applications/Microsoft Teams.app"
#dockutil --no-restart --add "/Applications/Slack.app"
#dockutil --no-restart --add "/Applications/Discord.app"
#defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'
#dockutil --no-restart --add "/Applications/Nova.app"
#dockutil --no-restart --add "/Applications/Transmit.app"
#dockutil --no-restart --add "/Applications/iTerm.app"
#defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'
#dockutil --no-restart --add "/Applications/Music.app"


killall Dock



# Mission Control

# Automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false



# Finder

# Show items on the desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -int 1
defaults write com.apple.finder ShowMountedServersOnDesktop -int 1

# Set default location for new Finder windows


# Show all filename extensions
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

killall Finder



# Disable Spotlight keyboard shortcut
#/usr/libexec/PlistBuddy -c "Set AppleSymbolicHotKeys:64:enabled false" $HOME/Library/Preferences/com.apple.symbolichotkeys.plist
