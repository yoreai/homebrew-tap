class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.12.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.12.1/relay-darwin-arm64"
      sha256 "c4d3cc18797d76a3baa3950216dfcc2e053141967e42ceb8427c9f9d45dc8e49"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.12.1/relay-darwin-x64"
      sha256 "03a786073bdd62783b5d9128c000a04792ef295b8bdb9a54ae06efbb520f4b5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.12.1/relay-linux-arm64"
      sha256 "90255f2a9c41fada83c3b9c5ed2d269f7eeb84d92bb2cfe0ee0ccfac253b1d8a"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.12.1/relay-linux-x64"
      sha256 "7bb786ee345994844d324ce275463d947769520736d5c6471cbc66ce1323cd2f"
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
