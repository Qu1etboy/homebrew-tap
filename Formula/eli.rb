# Template — CI fills 0.0.9 / 3a13a3edc45111b65e3ada23b34c7d67cda86cf8a8ef53fdf1879ba19fdb383e / 5607dc0bc5e69c17f2aa7fc388e021020a57392fc6a79384c369919fa150d294 and commits the
# result to the public homebrew-tap repo. Binaries are hosted on the tap's own
# releases, so the eli source repo can stay private.
class Eli < Formula
  desc "Presence producer for Eli — mood, usage, and status for the menu bar"
  homepage "https://github.com/Qu1etboy/homebrew-tap"
  version "0.0.9"

  if Hardware::CPU.arm?
    url "https://github.com/Qu1etboy/homebrew-tap/releases/download/v0.0.9/eli-v0.0.9-darwin-arm64.tar.gz"
    sha256 "3a13a3edc45111b65e3ada23b34c7d67cda86cf8a8ef53fdf1879ba19fdb383e"
  else
    url "https://github.com/Qu1etboy/homebrew-tap/releases/download/v0.0.9/eli-v0.0.9-darwin-amd64.tar.gz"
    sha256 "5607dc0bc5e69c17f2aa7fc388e021020a57392fc6a79384c369919fa150d294"
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
