class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.6.15"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.15/relay-darwin-arm64"
      sha256 "1ad5b6bac8bc0062650805c7df20c32a243807cbc4751603796157252d6253db"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.15/relay-darwin-x64"
      sha256 "cbacc1e54ec45c61d501238d53e1248582bee629d2aadada8a235262805ac4a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.15/relay-linux-arm64"
      sha256 "3c9e89a6b1c711ffbe10100e25c5dffda1b150cdc6dc038fc000e3b85415103d"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.15/relay-linux-x64"
      sha256 "4a069590f066c616069caa11a839fa9739ffa2e9f8de1f7ce71f5f5da4cbebe5"
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
