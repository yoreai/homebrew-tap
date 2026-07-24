class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.8.0/relay-darwin-arm64"
      sha256 "67d25813b4540ab256c903b9a566103c4211de83640d2a9f1c1277914e5286af"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.8.0/relay-darwin-x64"
      sha256 "67712eab5c96f0c59d64b9c86644d7abe5b03253f7737162732ca0832d14df6a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.8.0/relay-linux-arm64"
      sha256 "fbb8d33446308ac1649f9a9aeb8a6abcf1263b955d5d2c9025b17b905b05a3ed"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.8.0/relay-linux-x64"
      sha256 "944c8d123b312923708ba644755016596438508d95ed320579369475fa8fca38"
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
