class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.12.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.12.2/relay-darwin-arm64"
      sha256 "99f997052be64a984a13bf923ee6101f35cc395a7abd78b19db0c2f194f0d63f"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.12.2/relay-darwin-x64"
      sha256 "ea86a31b9a1083d816d9865039005a0289e2ac58397ec452df9a9b0c66027acc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.12.2/relay-linux-arm64"
      sha256 "b3ad6a9c9ca796a09c659cf899b9cced34e1bd6a49f2d016b7af856f4eab4c79"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.12.2/relay-linux-x64"
      sha256 "63b596798aea6ebf701e3b639a50d5a7b1814ad7d39b3bb03f5210929aa6d5e8"
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
