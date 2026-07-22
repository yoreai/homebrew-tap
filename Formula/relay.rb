class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.6.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.4/relay-darwin-arm64"
      sha256 "16bbc22645bc412b191ab99c41696cab6ec441c5db0d7bdd513aeef1413ccd11"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.4/relay-darwin-x64"
      sha256 "2650c4b77e967085527350701f2172840fe5f4bd3d0c4635be8bedcb82e32bca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.4/relay-linux-arm64"
      sha256 "2366264a8dfbee596fbd844d36322edcd0c6708dfe42417c6cc0431bb6768971"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.4/relay-linux-x64"
      sha256 "18b6bb86aacd16fbb6113416ff5f475d450f1aa1ee43d17582800d530737b27e"
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
