class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.9.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.9.1/relay-darwin-arm64"
      sha256 "e9b95972856316f4e6819fd51aa790484ac5bd9680d3f987f5e689ba73b76e7c"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.9.1/relay-darwin-x64"
      sha256 "d0e9d68d2d5854634cab8fcf50bad611160d989f592c676583d6582f313abaa2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.9.1/relay-linux-arm64"
      sha256 "55f5c628495f151827e855dfa203837e3abd617d330cecedb0044d5f1e113f09"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.9.1/relay-linux-x64"
      sha256 "c2016680e24b19cb89ca5cc7d59ee7ccf6237b0bc02befabd28d94b7612326a1"
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
