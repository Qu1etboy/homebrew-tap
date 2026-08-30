# Template — CI fills 0.0.8 / 5ee892c9738b7b189892e78e3457783bb74717a15146146f814d4d6cebdc9fb3 and commits the result to the
# public homebrew-tap repo. The zip is hosted on the tap's own releases.
cask "eli-app" do
  version "0.0.8"
  sha256 "5ee892c9738b7b189892e78e3457783bb74717a15146146f814d4d6cebdc9fb3"

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
