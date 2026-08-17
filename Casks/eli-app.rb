# Template — CI fills 0.0.6 / 06594d74ee7866861b09024f330aa131247881b23b36a17b2a461f70ed218a09 and commits the result to the
# public homebrew-tap repo. The zip is hosted on the tap's own releases.
cask "eli-app" do
  version "0.0.6"
  sha256 "06594d74ee7866861b09024f330aa131247881b23b36a17b2a461f70ed218a09"

  url "https://github.com/Qu1etboy/homebrew-tap/releases/download/v#{version}/Eli-v#{version}-macos.zip"
  name "Eli"
  desc "Menu bar presence app for Eli"
  homepage "https://github.com/Qu1etboy/homebrew-tap"

  depends_on macos: :ventura

  app "Eli.app"

  zap trash: [
    "~/.eli",
    "~/Library/LaunchAgents/co.fastwork.eli.plist",
  ]
end
