class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.1.0/relay-darwin-arm64"
      sha256 "REPLACE_AFTER_FIRST_RELEASE"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.1.0/relay-darwin-x64"
      sha256 "REPLACE_AFTER_FIRST_RELEASE"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.1.0/relay-linux-arm64"
      sha256 "REPLACE_AFTER_FIRST_RELEASE"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.1.0/relay-linux-x64"
      sha256 "REPLACE_AFTER_FIRST_RELEASE"
    end
  end

  def install
    bin.install Dir["relay-*"].first => "relay"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/relay --version")
  end
end
