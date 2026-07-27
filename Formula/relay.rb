class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.13.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.13.0/relay-darwin-arm64"
      sha256 "56b8ab249fbc811726038f1937f2f07cf1f884c921bb39645d67bc49a67e545c"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.13.0/relay-darwin-x64"
      sha256 "83fef6084d88341e049c4dc8a9d00e28b932beec400a6c5efc7cebc66389974d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.13.0/relay-linux-arm64"
      sha256 "6e300ad6d1f53923cc846e734bf2fc919b68cadaf49e77738c6f0bc96e3db79f"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.13.0/relay-linux-x64"
      sha256 "3611a146935dc6ffda6902bb6931d5263c91ed9b2f94a8a28607ee1a5623c89b"
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
