# Template — CI fills 0.0.11 / 510da62b3dec0247380be58f704d1212e0412049b8c39b312dade50c911e013b / addb4a4d9ef663b7921f896eaed2c239dc768c61003a60a36d02a3f2000f2725 and commits the
# result to the public homebrew-tap repo. Binaries are hosted on the tap's own
# releases, so the eli source repo can stay private.
class Eli < Formula
  desc "Presence producer for Eli — mood, usage, and status for the menu bar"
  homepage "https://github.com/Qu1etboy/homebrew-tap"
  version "0.0.11"

  if Hardware::CPU.arm?
    url "https://github.com/Qu1etboy/homebrew-tap/releases/download/v0.0.11/eli-v0.0.11-darwin-arm64.tar.gz"
    sha256 "510da62b3dec0247380be58f704d1212e0412049b8c39b312dade50c911e013b"
  else
    url "https://github.com/Qu1etboy/homebrew-tap/releases/download/v0.0.11/eli-v0.0.11-darwin-amd64.tar.gz"
    sha256 "addb4a4d9ef663b7921f896eaed2c239dc768c61003a60a36d02a3f2000f2725"
  end

  def install
    # Router + producer + voice client all go on PATH.
    bin.install "eli"        # git-style router: eli <cmd> -> eli-<cmd>
    bin.install "eli-usage"  # presence producer (run/install/doctor)
    bin.install "eli-say"    # voice client (Python, stdlib)
    # Voice server payload — copied to ~/.eli/voice by the voice installer,
    # because launchd can't run scripts from the Homebrew Cellar/TCC-protected
    # paths; ~/.eli is safe.
    libexec.install "kokoro_server.py", "kokoro-server.sh",
                    "com.eli.kokoro.plist", "install.sh"
  end

  def caveats
    <<~EOS
      Start the background timer that keeps Eli fresh:
        eli usage install
      Start the local voice server (Kokoro):
        ELI_BIN_DIR="#{bin}" bash #{libexec}/install.sh
      Then check it:
        eli usage doctor
        eli say "hello"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eli version")
  end
end
