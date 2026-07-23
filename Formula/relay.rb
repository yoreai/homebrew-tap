class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.6.12"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.12/relay-darwin-arm64"
      sha256 "6230bf01f3e72fbb283577aa557e853497b7a0bb9013691b72c07dc49f404e9b"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.12/relay-darwin-x64"
      sha256 "f5672e34d2c73aab39504aaf7a420e4c2c5df5d5027d4ad7c9913a79bb2baaaf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.12/relay-linux-arm64"
      sha256 "0d7a08b06cff75ebeef1be01d52ba2091536520713aa7a829b6f810ce0b37970"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.12/relay-linux-x64"
      sha256 "6df6ba5dc2747530aecc762e37861512f96284edc59766042052512e5662e6dd"
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
