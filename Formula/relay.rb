class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.6.13"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.13/relay-darwin-arm64"
      sha256 "39a9d15ce042dd5173b99e1bfbefdc2d7ae915f3aea5458faa55d6b32686e061"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.13/relay-darwin-x64"
      sha256 "4467dce5dcc2919850c79d304d7dbb14ac14a7e735dee5821cceda2fac825d17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.13/relay-linux-arm64"
      sha256 "afe7c558fd105199acb9232a4de6417dc112b143b02b09417bc850e8ad5fa78d"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.13/relay-linux-x64"
      sha256 "047838fa1908ef8ab268edc6ac7315e5ce01a9bad6dd3622dfdd4ccf50a97faa"
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
