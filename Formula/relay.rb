class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.8.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.8.1/relay-darwin-arm64"
      sha256 "f101585862b5dcb8ee9f9fe8240cac0f894b9c9a96edd9aff02d7efa5cfcb1ac"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.8.1/relay-darwin-x64"
      sha256 "66011bf156c615ed4a1f0d500886b3f489523ffa0d2837e9d197ebb107a07d0a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.8.1/relay-linux-arm64"
      sha256 "7729fd40c709c0ba648bd241f2380dc91df23929c42a0e15eb0f94843af330bb"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.8.1/relay-linux-x64"
      sha256 "df971507c3bfbda3c342773179fcf7dcd0841fc782b1c5b31ecf6a29c8e51e1d"
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
