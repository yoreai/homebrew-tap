class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.6.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.6/relay-darwin-arm64"
      sha256 "1dcf892911d2d14a6de33b2b0c38ccbeeaa99374e9a0f3d993aeaa1bc7bbb924"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.6/relay-darwin-x64"
      sha256 "db6ee4f4663dab49346726572f902d28be89bfe3ec908bd52b38be153726e480"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.6/relay-linux-arm64"
      sha256 "66752b1ca8cb349704b874135b6a5b574026d976d7b40a2138d29419c64259ea"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.6/relay-linux-x64"
      sha256 "bf98c407c8f49403d4ea7a4392b3bf9ea71363f40031f9bb89772aa9a6d9388a"
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
