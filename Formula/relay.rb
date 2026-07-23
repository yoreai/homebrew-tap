class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.6.19"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.19/relay-darwin-arm64"
      sha256 "44a79e2a47cb736df92b56f6ccff0a72af0479b33a0d37df4e25a0968c2a9527"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.19/relay-darwin-x64"
      sha256 "301c773ff59903774ae931f69f3efeb04ca212a1babdf97589876038630500d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.19/relay-linux-arm64"
      sha256 "f3b522a28d2e14f5930272ec9b33e6507b6131701b9600f4a82ca5bea8b8b81f"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.19/relay-linux-x64"
      sha256 "a8b9ac3479753c12dd439f14915e9be73f11d094c05436407d7a1dca68990b8e"
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
