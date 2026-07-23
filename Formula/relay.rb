class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.6.17"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.17/relay-darwin-arm64"
      sha256 "fefcc79e616d6b6e4f9e4c9df2a5110bf59d90db41daaf96d721458c8e645504"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.17/relay-darwin-x64"
      sha256 "0cfe8b91f3b95ca7a5d1767dab4750b5b7bceda1a62df1fb31b199c1b441d2d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.17/relay-linux-arm64"
      sha256 "e9eb79614d0ace35837c4dd3411d3acd36f2f4e2668f3a7a384e7329cd00c211"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.17/relay-linux-x64"
      sha256 "3850eb6db1bbfbdf02a18cbcfc9db5e01381c2dbfb33fa90c2fd2d9a883b14ea"
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
