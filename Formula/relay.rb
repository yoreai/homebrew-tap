class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.5.0/relay-darwin-arm64"
      sha256 "70e8a8b0a3b35e81f736cf5bbc6dc6fdfec729c4a400c2feb2cc51f199b2414e"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.5.0/relay-darwin-x64"
      sha256 "4a2e2dcd88f9f56b611a82fe8309d7784d53ea8719392ec7c6e3eacbcc82de47"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.5.0/relay-linux-arm64"
      sha256 "a1f0401ea6e5284005a64291920d71fb9789cb5bf126d765523bd798159eccf9"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.5.0/relay-linux-x64"
      sha256 "872c6e45efdde16ad058923d6cd3f91ed601bfffed95cc94855530c1af02ce3c"
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
