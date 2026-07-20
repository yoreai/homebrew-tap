class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.4.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.4.2/relay-darwin-arm64"
      sha256 "bc650d209bd8a34ab584a67e0477143197894d8745aa4fb30db6b88a3e119477"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.4.2/relay-darwin-x64"
      sha256 "d98e579488d391b4455f38e2e04adf8875a600a4fba19938ad93d27214885bff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.4.2/relay-linux-arm64"
      sha256 "aae029801bd96cf1b57f911326daa78ac9a09c00b7216e1dcbd3233045c164dc"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.4.2/relay-linux-x64"
      sha256 "39ec8b1105fbace83be7c3af0b1e8a6dd7f419e584a2b31d7ef86db4409a3e56"
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
