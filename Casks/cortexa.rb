cask "cortexa" do
  version "0.1.0"
  sha256 "287d74a2829b6dcfd411673d9aa11d4718d7e1e19579bb1c4c1a423d6fdba8d6"

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
  depends_on macos: ">= :ventura"

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
    System Settings → Privacy & Security → Open Anyway. Installing with
    `brew install --cask --no-quarantine yoreai/tap/cortexa` skips the warning altogether.
  EOS
end
