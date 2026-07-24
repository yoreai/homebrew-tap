class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.7.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.7.1/relay-darwin-arm64"
      sha256 "fa7215355c643d0e04f4b5ff1cd111cd79c557c28611dab3d1e4aa41e8bb3c59"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.7.1/relay-darwin-x64"
      sha256 "a249d51997e1898de98a7d47750f4e0493c88067fbd2853d310dce39010111fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.7.1/relay-linux-arm64"
      sha256 "828be540ce00e2043b28c2eb77aee4b5cfff0ff662dce159d2e17030bd25f102"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.7.1/relay-linux-x64"
      sha256 "eee8e5dabd4af0db9b20840509cbe3cca2b5e89951e8c30fd97b35cb47cce914"
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
