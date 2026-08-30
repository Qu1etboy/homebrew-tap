# Template — CI fills 0.0.10 / b93e339618f817ee81190bb994af629d3e6a7fd107c6a8e78a9aca4d360344e8 and commits the result to the
# public homebrew-tap repo. The zip is hosted on the tap's own releases.
cask "eli-app" do
  version "0.0.10"
  sha256 "b93e339618f817ee81190bb994af629d3e6a7fd107c6a8e78a9aca4d360344e8"

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
