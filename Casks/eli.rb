# Template — CI fills 0.0.2 / 5ba548ca3b3d53d603cd2683ef3538125037b066f8d6572188c14baa1367e962 and commits the result to the
# public homebrew-tap repo. The zip is hosted on the tap's own releases.
cask "eli" do
  version "0.0.2"
  sha256 "5ba548ca3b3d53d603cd2683ef3538125037b066f8d6572188c14baa1367e962"

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
