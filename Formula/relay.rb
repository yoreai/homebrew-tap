class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.9.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.9.0/relay-darwin-arm64"
      sha256 "34c01563b8eb4b1c071fa2bb7a3af306c654dc4ad8490f8094b8614c6d1e8abb"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.9.0/relay-darwin-x64"
      sha256 "38bf61ab0f39f20853b71e7df6469c23d7f27b5eac05b832be679fe52167cd51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.9.0/relay-linux-arm64"
      sha256 "95d649775d924bf4a629b7cdee56a8bb5863354d901d743b46cc9cf211b892e9"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.9.0/relay-linux-x64"
      sha256 "78a89615d055e2b1aea0d73f25ceb29581c643607f3c0b01155f1a41c28cd162"
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
