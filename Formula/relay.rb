class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.6.16"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.16/relay-darwin-arm64"
      sha256 "c6c02ff5484fc704516955aa0682c4f1fa9969811244c668926b375c5f8bafa0"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.16/relay-darwin-x64"
      sha256 "86aba1f9d8904304ec2cfa4daeb2ac78a8670ad835d307df5ff371a648e2ce63"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.6.16/relay-linux-arm64"
      sha256 "e81a1f948de4d0dbe213163756554c199e9a4c19a2103a04dd10143d00d30302"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.6.16/relay-linux-x64"
      sha256 "07bf849e2ed4fe321a42f64a50685443f34276c5479d81767ab6694e45db44e5"
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
