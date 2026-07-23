class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.6.11"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.11/relay-darwin-arm64"
      sha256 "50af44873b2e506fd53b998bbec239a890ae2b624fe3946afe3c923c7c22cf8f"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.11/relay-darwin-x64"
      sha256 "b7ab10d0585a7e1654e6ce4917295f233fe69f9070de3cc1f556b5f008db1845"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.11/relay-linux-arm64"
      sha256 "659cba4a93d65d3f4497cc4d7ce9a1cd0c8a35cc15586ad6b7f35adf4dae1254"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.11/relay-linux-x64"
      sha256 "591c4615224ac841b8556b7e6388f282482d0527794ccdeecafbc44a254aba3c"
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
