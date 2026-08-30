# Template — CI fills 0.0.10 / 68c151b2cefd0929ee9443218af47f0c2c07708167fb52959cf93ce3ebe64444 / 5a632a143af1c8b3ee98a6884fb4319d649b0676cad69ed78cfe9de0903fdecf and commits the
# result to the public homebrew-tap repo. Binaries are hosted on the tap's own
# releases, so the eli source repo can stay private.
class Eli < Formula
  desc "Presence producer for Eli — mood, usage, and status for the menu bar"
  homepage "https://github.com/Qu1etboy/homebrew-tap"
  version "0.0.10"

  if Hardware::CPU.arm?
    url "https://github.com/Qu1etboy/homebrew-tap/releases/download/v0.0.10/eli-v0.0.10-darwin-arm64.tar.gz"
    sha256 "68c151b2cefd0929ee9443218af47f0c2c07708167fb52959cf93ce3ebe64444"
  else
    url "https://github.com/Qu1etboy/homebrew-tap/releases/download/v0.0.10/eli-v0.0.10-darwin-amd64.tar.gz"
    sha256 "5a632a143af1c8b3ee98a6884fb4319d649b0676cad69ed78cfe9de0903fdecf"
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
