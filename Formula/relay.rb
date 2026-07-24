class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.8.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.8.4/relay-darwin-arm64"
      sha256 "9ad0a8545da8c33f986288763ff73b1baf6413a69d75dcd756fafe8f2c72baaf"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.8.4/relay-darwin-x64"
      sha256 "ef7c6e6da60993a96c99089a67f843320525c89edf94587e0af2a8291b6933c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.8.4/relay-linux-arm64"
      sha256 "187576811e32d8ef38dfa91915e5d4eac455b92da25fe79558e8f31095ee00de"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.8.4/relay-linux-x64"
      sha256 "e6609fcf36244116dc398341bcf3b01d7c30312e75aa79039d272995b3d90f20"
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
