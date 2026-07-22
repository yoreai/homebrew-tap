class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.6.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.3/relay-darwin-arm64"
      sha256 "635ada2f0fc5548b254e215c1fff28d49464fb10b70fcb41ec0767fd7a396e09"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.3/relay-darwin-x64"
      sha256 "b02c37579d3654923b7d5e8f5e776d7ae95e755b1ef9ab4612a5d4d08b690e78"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.3/relay-linux-arm64"
      sha256 "6b262917b6a316e3540e5de90ef2aa2a420218fe7f7dc7c80e1869c2731f5dce"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.3/relay-linux-x64"
      sha256 "f2994a4430ffc9b952b5ca897d9f5a1b7ec5546248cefef83ba70c88695f1703"
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
