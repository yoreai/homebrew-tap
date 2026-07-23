class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.7.0/relay-darwin-arm64"
      sha256 "71c23f75689317ee4d5f3c95835ff60e9b07c8bb5c342388564ed4bb80d74cf4"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.7.0/relay-darwin-x64"
      sha256 "1ebf454c3ef8f52943c7f435699894dce9aae5483aa7ffadc9196d05a48fc510"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.7.0/relay-linux-arm64"
      sha256 "3d0be9b9dba9faa949332778005a1a367237edb198c1fcb423efc976f28e135f"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.7.0/relay-linux-x64"
      sha256 "dfcbc823fd8e4b8cfae4a7108ae69eb00791dc0613a1a7b6e58bdcd826aaa5bc"
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
