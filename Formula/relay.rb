class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.8.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.8.3/relay-darwin-arm64"
      sha256 "6bd0083f25ef30d3c750b42f1814f2b9edef9da328133558cf07eaafdd601a8b"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.8.3/relay-darwin-x64"
      sha256 "4e30a9a69233f0866de0d448c1921bae47682e7eba90a17c3f500e72d1f29459"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.8.3/relay-linux-arm64"
      sha256 "219ef65f26e0c64d936a2d89fc539e32ca5a7d9f6d76d26e17959dfb748507a2"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.8.3/relay-linux-x64"
      sha256 "d0e26e6e7e6cf867d8a8c03e373ee2c7b5d97f408f1b97f26af1747ce8056c2f"
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
