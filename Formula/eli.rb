# Template — CI fills 0.0.6 / 30c1cda03a2aed08ae86207d407aa09d314b4e67ce054ee5e7f66b0f60103b6c / 659d5dac7fdd6a826fe4e7e96b290875afe79bd0058288fd622f695c506559cb and commits the
# result to the public homebrew-tap repo. Binaries are hosted on the tap's own
# releases, so the eli source repo can stay private.
class Eli < Formula
  desc "Presence producer for Eli — mood, usage, and status for the menu bar"
  homepage "https://github.com/Qu1etboy/homebrew-tap"
  version "0.0.6"

  if Hardware::CPU.arm?
    url "https://github.com/Qu1etboy/homebrew-tap/releases/download/v0.0.6/eli-v0.0.6-darwin-arm64.tar.gz"
    sha256 "30c1cda03a2aed08ae86207d407aa09d314b4e67ce054ee5e7f66b0f60103b6c"
  else
    url "https://github.com/Qu1etboy/homebrew-tap/releases/download/v0.0.6/eli-v0.0.6-darwin-amd64.tar.gz"
    sha256 "659d5dac7fdd6a826fe4e7e96b290875afe79bd0058288fd622f695c506559cb"
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
