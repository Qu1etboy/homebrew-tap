# Template — CI fills 0.0.4 / 110d4d265b15e5df1a6cb07fd3f7a920c709b260f5792f3fc397c85f14539dc7 and commits the result to the
# public homebrew-tap repo. The zip is hosted on the tap's own releases.
cask "eli" do
  version "0.0.4"
  sha256 "110d4d265b15e5df1a6cb07fd3f7a920c709b260f5792f3fc397c85f14539dc7"

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
