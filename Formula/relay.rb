class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.11.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.11.0/relay-darwin-arm64"
      sha256 "fb800a6a3daec1e444f3db043e10c14b73ab52daa63cccd622a0d1ba504e915d"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.11.0/relay-darwin-x64"
      sha256 "2fb4cb2fae490f00336464d580d9ce63065a6f8037c764d57bd8baaabc11231a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.11.0/relay-linux-arm64"
      sha256 "7f3f1ae52dbb778ff3c27af529cc80c8d78438e8e580ecba23e64529ede344ad"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.11.0/relay-linux-x64"
      sha256 "9836ed359993f56cec6cc56e69c6c95bba97c99f5356b9046ae943706920cb84"
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
