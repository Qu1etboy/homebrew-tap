# Template — CI fills 0.0.2 / ff70a5c0c90f4c480601cb078132e60e74ee497623951c286b0eec4451ceb587 / 6d3b9c60edab460d79ab43ffbc80a700e24b9f1c95fabecc6b898a6a26eafde4 and commits the
# result to the public homebrew-tap repo. Binaries are hosted on the tap's own
# releases, so the eli source repo can stay private.
class Eli < Formula
  desc "Presence producer for Eli — mood, usage, and status for the menu bar"
  homepage "https://github.com/Qu1etboy/homebrew-tap"
  version "0.0.2"

  if Hardware::CPU.arm?
    url "https://github.com/Qu1etboy/homebrew-tap/releases/download/v0.0.2/eli-v0.0.2-darwin-arm64.tar.gz"
    sha256 "ff70a5c0c90f4c480601cb078132e60e74ee497623951c286b0eec4451ceb587"
  else
    url "https://github.com/Qu1etboy/homebrew-tap/releases/download/v0.0.2/eli-v0.0.2-darwin-amd64.tar.gz"
    sha256 "6d3b9c60edab460d79ab43ffbc80a700e24b9f1c95fabecc6b898a6a26eafde4"
  end

  def install
    bin.install "eli"
  end

  def caveats
    <<~EOS
      Start the background timer that keeps Eli fresh:
        eli install
      Then check it:
        eli doctor
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eli version")
  end
end
