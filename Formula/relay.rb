class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.1.0/relay-darwin-arm64"
      sha256 "4ec6f22bb2e6ec0ca6429b61b5d62ae22ebad0c0bee446f727acf87f9495d679"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.1.0/relay-darwin-x64"
      sha256 "64814a797b8e03c374c8d800d7f576f1400541229a5b9e4ab0d8d763b402894a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.1.0/relay-linux-arm64"
      sha256 "0dc851d0aa41d5a28fb5b4440da3c4abcbf02bd1b4a79a37ce391f3c1f76ffae"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.1.0/relay-linux-x64"
      sha256 "0216a8428d0bd3f35f60f7c3f7ada3b9a8ed51f0cad306d24e417f48c3518ff2"
    end
  end

  def install
    bin.install Dir["relay-*"].first => "relay"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/relay --version")
  end
end
