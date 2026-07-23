class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.6.9"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.9/relay-darwin-arm64"
      sha256 "6d77982a3552555fc4b7f442a05d4cca1ec7c0f5699b685eebb2681f0ec53402"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.9/relay-darwin-x64"
      sha256 "86d9b93684386cd1d8e308e66e3c1c7a368270b7a1343dfb85a35b625dd24686"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.9/relay-linux-arm64"
      sha256 "7d16abb8ec6f480f7c2d250cc5eae6386cdf159c9b92fa70e6a717ec69097f6a"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.9/relay-linux-x64"
      sha256 "c085fcd100d72ce231dfdfc172a7847b44221f103e6dbbc9c3b322224714e65b"
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
