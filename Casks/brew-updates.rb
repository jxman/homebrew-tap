cask "brew-updates" do
  version "1.9.0"
  sha256 "9a89a983035888834892331a5f64585e35a69241ac0c7cf56899e8b9e0b5379e"

  url "https://github.com/jxman/brew-updates/releases/download/app-v#{version}/Brew-Updates-#{version}.dmg"
  name "Brew Updates"
  desc "Keeps Homebrew packages updated, backed up and scanned on a schedule"
  homepage "https://github.com/jxman/brew-updates"

  livecheck do
    url :url
    regex(/^app-v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  # The app updates itself (Sparkle), so `brew upgrade` leaves it alone
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Brew Updates.app"

  # The schedule the app sets up on first launch
  uninstall launchctl: "com.jxman.brew-updates",
            quit:      "com.jxman.BrewUpdates"

  zap trash: [
    "~/.brew_backups",
    "~/.brew_logs",
    "~/.brew_update_config",
    "~/Library/Application Support/Brew Updates",
    "~/Library/Caches/com.jxman.BrewUpdates",
    "~/Library/HTTPStorages/com.jxman.BrewUpdates",
    "~/Library/HTTPStorages/com.jxman.BrewUpdates.binarycookies",
    "~/Library/LaunchAgents/com.jxman.brew-updates.plist.app-backup",
    "~/Library/LaunchAgents/com.user.brew-update.plist.migrated",
    "~/Library/Preferences/com.jxman.BrewUpdates.plist",
    "~/Library/Saved Application State/com.jxman.BrewUpdates.savedState",
  ]
end
