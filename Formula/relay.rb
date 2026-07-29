class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.13.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.13.1/relay-darwin-arm64"
      sha256 "a7b6d2991c6573c6fefca0429bc1b9a4c70bf7c0a7eb57b4bb56c36bf06829c1"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.13.1/relay-darwin-x64"
      sha256 "60bb2b60f0508a34efc7658304ffa7dfeb1880d0a05ca60545c24b1ec61d83d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.13.1/relay-linux-arm64"
      sha256 "2bebd0d3edc75ead3f09af92116414545a7a2dd0831d7be4faee36cacd6f7156"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.13.1/relay-linux-x64"
      sha256 "f3076ad51bf3e9d413bbf6a38f8d4824f3c2245e2e218c4ab3d5fdc6dac0c619"
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
