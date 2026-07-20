class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.2.0/relay-darwin-arm64"
      sha256 "31a1f2b25f717e29fd3fe2c875e276d2a5394aaa9ea20eed263d56adaaa739f4"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.2.0/relay-darwin-x64"
      sha256 "f7aff35eed79285a8d9795367d789bfdcd1b5eaf448ff9acffd48633589b4529"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.2.0/relay-linux-arm64"
      sha256 "67afd32ff05aa9f439726d65f97daf6e7b9a670031e976b06a209352dd1c3dd4"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.2.0/relay-linux-x64"
      sha256 "9210efefe9b49cfe58f715a3e11688df1bb69a8a810e997d3219cd4b06a916f6"
    end
  end

  def install
    bin.install Dir["relay-*"].first => "relay"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/relay --version")
  end
end
