class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.6.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.1/relay-darwin-arm64"
      sha256 "745195bd5063b49004f707953734eb8e2be6516aa9350f6a6a59241fc9daa45b"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.1/relay-darwin-x64"
      sha256 "2103af1624363eeaf574e925fb6a59e662d7f8f2759f83ab19299836716da695"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.1/relay-linux-arm64"
      sha256 "4ff0463db76b59ff5bb702966d4398ae3f669971a10428e7bcbb3beaeabd130c"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.1/relay-linux-x64"
      sha256 "f5f94e189f313481d2244a1b353e6965a748c564cd07e4fbcb16377e260c0e64"
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
