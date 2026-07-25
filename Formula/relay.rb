class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.12.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.12.0/relay-darwin-arm64"
      sha256 "9ab425986e62e2b19437434e0ee61963812e94f60271fb7d578710b552571660"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.12.0/relay-darwin-x64"
      sha256 "26393710a34cef9ac261e533ac9ca12fe1ee6566d4a567d5fbb2b7172c1c05a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.12.0/relay-linux-arm64"
      sha256 "9c5643c5af70a36c41912b61804910d7d229235c66bedb3a113822f34c07af21"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.12.0/relay-linux-x64"
      sha256 "b9cb446254feebf66cf683a335cb9e6ab514d4b4a4df219eaf2920d820d20722"
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
