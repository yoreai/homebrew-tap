cask "cortexa" do
  version "0.1.3"
  sha256 "582688956e1ddcf5d005cef550002b984b6a0d3d862ff132be745fa4dba9a86a"

  url "https://github.com/yoreai/cortexa-desktop/releases/download/cortexa-desktop-v#{version}/Cortexa-#{version}-mac-arm64.zip"
  name "Cortexa"
  desc "The research agent that shows its work — desktop app for cortexa.sh"
  homepage "https://cortexa.sh/download"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^cortexa-desktop-v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Cortexa.app"

  zap trash: [
    "~/Library/Application Support/Cortexa",
    "~/Library/Logs/Cortexa",
    "~/Library/Preferences/sh.cortexa.desktop.plist",
    "~/Library/Saved Application State/sh.cortexa.desktop.savedState",
  ]

  caveats <<~EOS
    This build of Cortexa is not yet signed with an Apple Developer ID, so macOS warns the first
    time you open it. Right-click (or Control-click) Cortexa in Applications and choose Open, then
    Open again. On macOS 15 and later, open it once, dismiss the warning, then allow it under
    System Settings → Privacy & Security → Open Anyway. To skip the warning instead, run
    `xattr -dr com.apple.quarantine /Applications/Cortexa.app` once after installing.

    Keychain prompt: macOS may ask for your login password the first time each new unsigned
    version opens ("Cortexa wants to use your confidential information stored in
    Cortexa Safe Storage"). That is the app reading its own cookie-encryption key; allowing it is
    safe. It stops once builds are signed with an Apple Developer ID.
  EOS
end
