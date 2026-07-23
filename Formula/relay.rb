class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.6.18"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.18/relay-darwin-arm64"
      sha256 "a5b49bfd275a6c20ceef45a3b3eebacfeb1885540fbb9060d8ae2ce391c762c4"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.18/relay-darwin-x64"
      sha256 "77f57e3b4fe92f5c87c55c7fdb994dc75523a201e21c4c6c173cd20a2d5e6114"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.18/relay-linux-arm64"
      sha256 "21f9979aecec8c61b58f18ef19e7d320d332683cb2966115a326c722e8327a72"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.18/relay-linux-x64"
      sha256 "a03a4d70d877f1647f865efc3e4e83f1394bc47f4fe76cbe07872cd258775a37"
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
