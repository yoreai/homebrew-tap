class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.0/relay-darwin-arm64"
      sha256 "77e1c9b931669968415e4f5ff3c979c898eaf89d0d5b96f4b920dd6bf9cfd111"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.0/relay-darwin-x64"
      sha256 "155c8238ae8097b4d28c422f46e68b7d4f944c3c34ca4ceb11a056e2c87c8d8f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.0/relay-linux-arm64"
      sha256 "2c981c9e95e19a7cd3e3496b23852cc9edf25b8ef8415d5c5aba5285111bf73f"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.0/relay-linux-x64"
      sha256 "f369a19f412b3e1010dc5d8d531e0ada9b6a1db1a4d3d89c6a834a3eafea7230"
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
