# Template — CI fills 0.0.9 / 46b4f580bf6533976615f03e1ad25c9d45d90f2d6f1d34145b4ce588bd174d95 and commits the result to the
# public homebrew-tap repo. The zip is hosted on the tap's own releases.
cask "eli-app" do
  version "0.0.9"
  sha256 "46b4f580bf6533976615f03e1ad25c9d45d90f2d6f1d34145b4ce588bd174d95"

  url "https://github.com/Qu1etboy/homebrew-tap/releases/download/v#{version}/Eli-v#{version}-macos.zip"
  name "Eli"
  desc "Menu bar presence app for Eli"
  homepage "https://github.com/Qu1etboy/homebrew-tap"

  depends_on macos: :ventura

  app "Eli.app"

  # Eli is ad-hoc signed, not notarized. Homebrew 6.0 removed the automatic
  # unquarantine, so without this Gatekeeper flags the app as "damaged".
  # Strip the quarantine flag on install so it opens cleanly.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Eli.app"]
  end

  zap trash: [
    "~/.eli",
    "~/Library/LaunchAgents/co.fastwork.eli.plist",
  ]
end
