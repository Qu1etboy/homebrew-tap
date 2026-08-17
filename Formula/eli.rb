# Template — CI fills 0.0.7 / d75b03a38536256fa2814c50b9912d7829e1a6b1a0bfcbbe51077e59efa829a8 / 3c025e4f7f060d10d017cb2fd811f2829737f43f648103bdb7e7d44fd8193d0b and commits the
# result to the public homebrew-tap repo. Binaries are hosted on the tap's own
# releases, so the eli source repo can stay private.
class Eli < Formula
  desc "Presence producer for Eli — mood, usage, and status for the menu bar"
  homepage "https://github.com/Qu1etboy/homebrew-tap"
  version "0.0.7"

  if Hardware::CPU.arm?
    url "https://github.com/Qu1etboy/homebrew-tap/releases/download/v0.0.7/eli-v0.0.7-darwin-arm64.tar.gz"
    sha256 "d75b03a38536256fa2814c50b9912d7829e1a6b1a0bfcbbe51077e59efa829a8"
  else
    url "https://github.com/Qu1etboy/homebrew-tap/releases/download/v0.0.7/eli-v0.0.7-darwin-amd64.tar.gz"
    sha256 "3c025e4f7f060d10d017cb2fd811f2829737f43f648103bdb7e7d44fd8193d0b"
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
