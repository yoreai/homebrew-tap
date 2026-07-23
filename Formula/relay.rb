class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.6.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.8/relay-darwin-arm64"
      sha256 "ade2eba8fbf6c44a88b16e46ffae587bf9b18db4c9213086727d9f864f58d9d7"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.8/relay-darwin-x64"
      sha256 "2afe8832a8c4a264e6550477fc8f2651badc3966e01676998a572582d2757e4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.8/relay-linux-arm64"
      sha256 "98cfa511722af6c11f0cdf989e3a91df98cd1a4ddf96085219e6ce9621d9c3ff"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.8/relay-linux-x64"
      sha256 "0ad3f3b98f26c7613a4b680ea529c4832dae2c7cdeb7e0971de12ad231f8a8af"
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
