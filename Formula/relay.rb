class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.8.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.8.2/relay-darwin-arm64"
      sha256 "7870e402bc398521dc0ea50d6313e9bc4ab5815834f646b370956393c1a934a6"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.8.2/relay-darwin-x64"
      sha256 "c36d84b136f54b2990d08faa8693fd11f73c9c9f51df96aeeec1578b23622fd6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.8.2/relay-linux-arm64"
      sha256 "4b8864bb4976351f09932ab210e09fb1824e22c7236c00031ba4c44a7dc64d0b"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.8.2/relay-linux-x64"
      sha256 "fa04eb51fcec269dfbe395a08ae94b76dc86f53ee948c93ab4745014228de0d4"
    end
  end

  def install
    bin.install Dir["relay-*"].first => "relay"
  end

  def caveats
    <<~EOS
      Next step (one command):
        relay setup     # registers relay as an MCP tool in Cursor / Claude Code

      Then check everything is wired:
        relay doctor    # which agent CLIs were found + where each tier routes

      relay stores no credentials — it uses your existing cursor-agent /
      claude / codex logins. To make agents delegate automatically, add the
      "Delegation policy" snippet from the README to your repo's AGENTS.md.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/relay --version")
  end
end
