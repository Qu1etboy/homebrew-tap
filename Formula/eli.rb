# Template — CI fills 0.0.8 / e0874d280e5f9ecb282545c65d25cb97eb4b19aa282b4dc2aa50a8b5dcfcc1a3 / 69df1d2065441986e220467100cf720a6dbbb75208665d84b931bb037807f68c and commits the
# result to the public homebrew-tap repo. Binaries are hosted on the tap's own
# releases, so the eli source repo can stay private.
class Eli < Formula
  desc "Presence producer for Eli — mood, usage, and status for the menu bar"
  homepage "https://github.com/Qu1etboy/homebrew-tap"
  version "0.0.8"

  if Hardware::CPU.arm?
    url "https://github.com/Qu1etboy/homebrew-tap/releases/download/v0.0.8/eli-v0.0.8-darwin-arm64.tar.gz"
    sha256 "e0874d280e5f9ecb282545c65d25cb97eb4b19aa282b4dc2aa50a8b5dcfcc1a3"
  else
    url "https://github.com/Qu1etboy/homebrew-tap/releases/download/v0.0.8/eli-v0.0.8-darwin-amd64.tar.gz"
    sha256 "69df1d2065441986e220467100cf720a6dbbb75208665d84b931bb037807f68c"
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
