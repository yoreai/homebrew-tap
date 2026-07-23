class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.6.10"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.10/relay-darwin-arm64"
      sha256 "181ee549959bba29c33307e5db9146519c1163ccd026f9927e0da866ddce9cc6"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.10/relay-darwin-x64"
      sha256 "371e6276c3b5bbbe4c895d9725a2cdbf4f8b74d47216db86285ae19800c58e51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.10/relay-linux-arm64"
      sha256 "4eb9582d144208f3a49a92fe0e5f4e0b1683c18f546e2bf1a4ac0a46187d1e30"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.10/relay-linux-x64"
      sha256 "891de3cb15427bb0b4f1236180f770666ac26cc20d5f9210dd68a62b8a067eec"
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
