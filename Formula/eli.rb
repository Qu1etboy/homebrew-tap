# Template — CI fills 0.0.12 / 90e0beb10e6f4f20ef3d83a7cb76ddbc900d964d1d1a41d60cf9b34d724da3d3 / a910e52c39e969e4cd3b93dc55aaa57b0a03a52b38cadbf4e338b7b9f12fb7f7 and commits the
# result to the public homebrew-tap repo. Binaries are hosted on the tap's own
# releases, so the eli source repo can stay private.
class Eli < Formula
  desc "Presence producer for Eli — mood, usage, and status for the menu bar"
  homepage "https://github.com/Qu1etboy/homebrew-tap"
  version "0.0.12"

  if Hardware::CPU.arm?
    url "https://github.com/Qu1etboy/homebrew-tap/releases/download/v0.0.12/eli-v0.0.12-darwin-arm64.tar.gz"
    sha256 "90e0beb10e6f4f20ef3d83a7cb76ddbc900d964d1d1a41d60cf9b34d724da3d3"
  else
    url "https://github.com/Qu1etboy/homebrew-tap/releases/download/v0.0.12/eli-v0.0.12-darwin-amd64.tar.gz"
    sha256 "a910e52c39e969e4cd3b93dc55aaa57b0a03a52b38cadbf4e338b7b9f12fb7f7"
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
