class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.6.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.2/relay-darwin-arm64"
      sha256 "b4f5a69781d42313cc0040146a9aae790c65d69a3ecf10adf8d8e93962805cd4"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.2/relay-darwin-x64"
      sha256 "491b067ecf5ab5a2e39198560d523cfdb62d964f27baef239348919a5db405f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.2/relay-linux-arm64"
      sha256 "0dce0d589e24072236b8c12b5182997877d0c4ae6e63d477a2daa3fcf823c943"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.2/relay-linux-x64"
      sha256 "c824da088a9b45258108ebe89c9ba02f7ea66a2c60898cddb93c66812719d9a4"
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
