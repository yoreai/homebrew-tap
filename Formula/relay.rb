class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.5.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.5.1/relay-darwin-arm64"
      sha256 "1d18e75deaba599abc2406cd4cc8c9d10ffc7aa6985898d739f0cb7999b1a26b"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.5.1/relay-darwin-x64"
      sha256 "b7f29beaff0b28a250015c4e51e23354f0a6d4f079507618d2936d80ce3d87cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.5.1/relay-linux-arm64"
      sha256 "1e3db76ee43886943cdbbfcf84367bf335df4c037f24e244b9aa73a3dc9b1967"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.5.1/relay-linux-x64"
      sha256 "39b6f07599eae6052964ced2bc04d31e9f4e77c3d196c4d07a99c216291ba4af"
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
