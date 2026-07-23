class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.6.14"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.14/relay-darwin-arm64"
      sha256 "1cad0dc621152682d65715a5dc8c30578f54ce8fcb682465e4fb392b48705685"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.14/relay-darwin-x64"
      sha256 "25e311e2e0938c0b43ead799ec7c241c0d1fd0f5d6a1ac241f1b0334e08eda8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.14/relay-linux-arm64"
      sha256 "722a220dd6fd98a9068e50d8ec3615aa9c8b4cd81df1d69c67fe8bf171c1be47"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.14/relay-linux-x64"
      sha256 "284d19b42bfe722138e61f4dfab4f3e2d0e9bb6382ca53b017249e6f18423f09"
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
