class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.6.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.7/relay-darwin-arm64"
      sha256 "9f8d871e782a1887ed5965eec23179f2e83ed61240e5af2188895607a69979dd"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.7/relay-darwin-x64"
      sha256 "75b60b5d02706a68e761bab74e90a91473702679a377ec8c67b852ffaeae8612"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.7/relay-linux-arm64"
      sha256 "849b106dcebcb51b22a452f012df2b49e2f3d0342b0c2dc7da046d9c07a151ef"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.7/relay-linux-x64"
      sha256 "032f15c334f1f3a121a6da0f6a11a3c971bb78047223caf8c3cbfa24c2cca0f7"
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
