class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.1.1/relay-darwin-arm64"
      sha256 "9af00fa965c76b823b6a46552e6fde2ab53df067d03862e27cf9dbf54f780154"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.1.1/relay-darwin-x64"
      sha256 "c65b3c7118e3efaafb693f5c06a4c666cd789ce0e439a5df71d7d3789079db55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.1.1/relay-linux-arm64"
      sha256 "69f9bdec81bddc0fa095d86ceb2543dcc0a9162c67bbf9f9b2e24054243ab4f8"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.1.1/relay-linux-x64"
      sha256 "51c7b78aa52f402b1636d262e76f9f7045367035a1e7d6a79a38884a0d144c89"
    end
  end

  def install
    bin.install Dir["relay-*"].first => "relay"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/relay --version")
  end
end
