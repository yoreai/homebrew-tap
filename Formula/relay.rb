class Relay < Formula
  desc "Interface-independent task router for AI agents"
  homepage "https://github.com/yoreai/relay"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.3.0/relay-darwin-arm64"
      sha256 "a23398340bfdce07ca342cbec329a0bf6297a2e36f1220520a9b5698c1f13927"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.3.0/relay-darwin-x64"
      sha256 "ff687635c7d0af867cc542a7e5d1521218b03ce3646f233921ced0ae9ab80121"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yoreai/relay/releases/download/v0.3.0/relay-linux-arm64"
      sha256 "f9263cf035729312c7499bdea889b17a70dbb7e746bc245cef0602fb73806aa8"
    end
    on_intel do
      url "https://github.com/yoreai/relay/releases/download/v0.3.0/relay-linux-x64"
      sha256 "447674b2e7a1469258a48ab1f6f6a717337591a919658bcbc923537fd3d5e186"
    end
  end

  def install
    bin.install Dir["relay-*"].first => "relay"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/relay --version")
  end
end
