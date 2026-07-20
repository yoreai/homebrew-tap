class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.4.0/relay-darwin-arm64"
      sha256 "f0c2a59c2b07b22ba6189423e44866f666c123ced48f841411680250f202e303"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.4.0/relay-darwin-x64"
      sha256 "0e2022f668c28d579cca4702d5d83fdf604db78533637bb7c3c294f5aa27bc1c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.4.0/relay-linux-arm64"
      sha256 "92e41f86ffcdfc72016f668ba10f0e675d776192ba557860f8ad4ee7188e524a"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.4.0/relay-linux-x64"
      sha256 "2bf197980b532e0f79a7f1492a7d612286fc82fb0877eaf2f3454aa34bc94d1b"
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
