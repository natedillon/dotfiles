# Set project path
if [ ! -d "$HOME/Projects" ]; then
  mkdir "$HOME/Projects"
fi
export PROJECT_PATH="$HOME/Projects"

# Chef
if [ -d "/opt/chefdk/bin" ]; then
  export PATH=/opt/chefdk/bin:$PATH
fi

# K-State Java VM settings
export CLUSTER_STANDALONE=true

# Start/stop GlobalProtect VPN
alias start-vpn="launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*"
alias stop-vpn="launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*"
