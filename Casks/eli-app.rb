# Template — CI fills 0.0.7 / fb7b0e337381d6e421eb4bce56a6e9dba5f4cb3b452d20fe7cc6760ab0e99a4a and commits the result to the
# public homebrew-tap repo. The zip is hosted on the tap's own releases.
cask "eli-app" do
  version "0.0.7"
  sha256 "fb7b0e337381d6e421eb4bce56a6e9dba5f4cb3b452d20fe7cc6760ab0e99a4a"

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
