class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.10.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.10.0/relay-darwin-arm64"
      sha256 "4724408cb6d4f83e84db224d759e9c599105b7fa1c5163fe8a6760145459d6a3"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.10.0/relay-darwin-x64"
      sha256 "ffa2302f13354b26cf7b18373c4aac4000c0b87a82499eabc120ad57edfbede7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.10.0/relay-linux-arm64"
      sha256 "e57f11b49d1bee5cc3a5f87cce9036b10f9cc5335fe7586ce747cfbdd55d007b"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.10.0/relay-linux-x64"
      sha256 "3d9fd6df3fb61375da81b1c3d4e10212d726b0dd9c6415f3b4c2e11f4dafd967"
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
