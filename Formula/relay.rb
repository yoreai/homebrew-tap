class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.6.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.5/relay-darwin-arm64"
      sha256 "62c7c7c0bedf74df36a29553b4cb0b3b00a5441531318b6a77f3115d284b9382"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.5/relay-darwin-x64"
      sha256 "468b9abfb5a371237de1a9e3a2602da054332f9cfa399046c7e9751c138a9363"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.5/relay-linux-arm64"
      sha256 "9f1b109a00f40242d495c49e34714fb827b1901502cde97e15abc148c54bedb4"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.5/relay-linux-x64"
      sha256 "20b9906146c2472ab66bbfe439ebf792722e2abe6e9adf8718b40fe295b2b114"
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
