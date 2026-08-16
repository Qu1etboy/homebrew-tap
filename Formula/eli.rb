# Template — CI fills 0.0.3 / 125db485f2043edcdbe7663002520933e45d20cdefb80234c7634e86350a31e6 / b4852f07a17161f80f5cfe40fd6c7ea0df7137442dedd443ac3a1be2154dbaad and commits the
# result to the public homebrew-tap repo. Binaries are hosted on the tap's own
# releases, so the eli source repo can stay private.
class Eli < Formula
  desc "Presence producer for Eli — mood, usage, and status for the menu bar"
  homepage "https://github.com/Qu1etboy/homebrew-tap"
  version "0.0.3"

  if Hardware::CPU.arm?
    url "https://github.com/Qu1etboy/homebrew-tap/releases/download/v0.0.3/eli-v0.0.3-darwin-arm64.tar.gz"
    sha256 "125db485f2043edcdbe7663002520933e45d20cdefb80234c7634e86350a31e6"
  else
    url "https://github.com/Qu1etboy/homebrew-tap/releases/download/v0.0.3/eli-v0.0.3-darwin-amd64.tar.gz"
    sha256 "b4852f07a17161f80f5cfe40fd6c7ea0df7137442dedd443ac3a1be2154dbaad"
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
