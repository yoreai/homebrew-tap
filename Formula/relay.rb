class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.7.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.7.2/relay-darwin-arm64"
      sha256 "4588ceffeb4d59e18992c91744235d1c35e465cd487defd85a044f7ae04cbfb1"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.7.2/relay-darwin-x64"
      sha256 "e1eaab1a978d5a23319db976c0d328cdb802148fc9ffbb550c0675e9b9658c0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.7.2/relay-linux-arm64"
      sha256 "b22ccc02525fb089d4060deef0b278e0342303c30060495e28da4ef26e80cbe7"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.7.2/relay-linux-x64"
      sha256 "4b82d765e32d8cc60752b80ac963c0489a4a73e506d7ae38d5d812930830488d"
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
