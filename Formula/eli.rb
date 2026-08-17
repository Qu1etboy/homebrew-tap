# Template — CI fills 0.0.4 / 556453830d4be30e3a94d7346776427444901d0d095462ad628f3c53db210be4 / 5a4ec6e5f6845ac7996c6370ab2bc5c2e265da6be78f0db41d26ce5998bb33ce and commits the
# result to the public homebrew-tap repo. Binaries are hosted on the tap's own
# releases, so the eli source repo can stay private.
class Eli < Formula
  desc "Presence producer for Eli — mood, usage, and status for the menu bar"
  homepage "https://github.com/Qu1etboy/homebrew-tap"
  version "0.0.4"

  if Hardware::CPU.arm?
    url "https://github.com/Qu1etboy/homebrew-tap/releases/download/v0.0.4/eli-v0.0.4-darwin-arm64.tar.gz"
    sha256 "556453830d4be30e3a94d7346776427444901d0d095462ad628f3c53db210be4"
  else
    url "https://github.com/Qu1etboy/homebrew-tap/releases/download/v0.0.4/eli-v0.0.4-darwin-amd64.tar.gz"
    sha256 "5a4ec6e5f6845ac7996c6370ab2bc5c2e265da6be78f0db41d26ce5998bb33ce"
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
