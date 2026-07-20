class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.4.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.4.1/relay-darwin-arm64"
      sha256 "90592b93f46b0b9fc2e268ac47b599fe82833034cadea9b4071d243442efc1b3"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.4.1/relay-darwin-x64"
      sha256 "56d873276a7e178a20f5d072bed8c2b2fd619aca1edd82177a02be6c18641819"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.4.1/relay-linux-arm64"
      sha256 "bd2762bc353071199f02995e1ff9d4b0c7c3be20b11fc02c579870fa8903cc27"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.4.1/relay-linux-x64"
      sha256 "a84c77253162e404e8c8ed4386cf06f154bd72a32fc6507a467c96ec62ceaa48"
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
